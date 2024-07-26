const admin = require("firebase-admin/app");
admin.initializeApp();

const helloWorldCloudFunction = require("./hello_world_cloud_function.js");
exports.helloWorldCloudFunction =
  helloWorldCloudFunction.helloWorldCloudFunction;
