const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.helloWorldCloudFunction = functions.https.onCall((data, context) => {
  // Write your code below!

  console.log("hello world");

  const date = new Date();

  const result = `hello world: ${date}`;

  // Write your code above!
  return result;
});
