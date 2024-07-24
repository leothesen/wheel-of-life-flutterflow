const fs = require('fs');
const { exec } = require('child_process');

const projectId = process.argv[2];
const firebaseConfigPath = 'lib/backend/firebase/firebase_config.dart';
const firebaseJsonPath = 'firebase.json';
const firebasercPath = '.firebaserc';

// Function to fetch Firebase config from Firebase CLI
function getFirebaseConfig(projectId) {
  return new Promise((resolve, reject) => {
    exec(`firebase apps:sdkconfig WEB --project ${projectId}`, (error, stdout, stderr) => {
      if (error) {
        console.error(`exec error: ${error}`);
        console.error(`stderr: ${stderr}`);
        reject(error);
        return;
      }
      console.log(`stdout: ${stdout}`);
      const config = JSON.parse(stdout.match(/{[^]*}/)[0]);
      resolve(config);
    });
  });
}

// Function to update Firebase configuration in the Dart file
async function updateFirebaseConfig() {
  try {
    const config = await getFirebaseConfig(projectId);

    const newFileContent = `import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "${config.apiKey}",
        authDomain: "${config.authDomain}",
        projectId: "${config.projectId}",
        storageBucket: "${config.storageBucket}",
        messagingSenderId: "${config.messagingSenderId}",
        appId: "${config.appId}"
      )
    );
  }
}
`;

    fs.writeFileSync(firebaseConfigPath, newFileContent, 'utf8');
    console.log('Firebase configuration updated successfully.');
  } catch (error) {
    console.error('Error updating Firebase configuration:', error);
    process.exit(1); // Exit with a failure status code
  }
}

// Function to update the 'hosting.public' field in firebase.json
function updateFirebaseJson() {
  try {
    const firebaseJson = JSON.parse(fs.readFileSync(firebaseJsonPath, 'utf8'));

    // Update the 'hosting.public' field
    firebaseJson.hosting.public = "build/web";

    fs.writeFileSync(firebaseJsonPath, JSON.stringify(firebaseJson, null, 2), 'utf8');
    console.log('firebase.json updated successfully.');
  } catch (error) {
    console.error('Error updating firebase.json:', error);
    process.exit(1); // Exit with a failure status code
  }
}

// Function to create or update the .firebaserc file
function updateFirebaserc() {
  try {
    const firebasercContent = {
      projects: {
        default: projectId
      }
    };

    fs.writeFileSync(firebasercPath, JSON.stringify(firebasercContent, null, 2), 'utf8');
    console.log('.firebaserc updated successfully.');
  } catch (error) {
    console.error('Error updating .firebaserc:', error);
    process.exit(1); // Exit with a failure status code
  }
}

// Main function to run the updates
async function main() {
  try {
    await updateFirebaseConfig();
    updateFirebaseJson();
    updateFirebaserc();
  } catch (error) {
    console.error('Error in main function:', error);
    process.exit(1); // Exit with a failure status code
  }
}

main();
