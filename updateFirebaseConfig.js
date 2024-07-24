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
        reject(`exec error: ${error}`);
        return;
      }
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
  }
}

// Main function to run the updates
async function main() {
  await updateFirebaseConfig();
  updateFirebaseJson();
  updateFirebaserc();
}

main();
