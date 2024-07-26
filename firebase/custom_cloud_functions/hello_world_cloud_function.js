const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.helloWorldCloudFunction = functions
  .region("europe-west2")
  .https.onCall((data, context) => {
    console.log("context", context);
    if (!context.auth.uid) {
      return;
    }
    // Write your code below!

    console.log("hello world");

    const date = new Date();

    const result = `hello world: ${date}`;

    // Write your code above!
    return result;
  });
