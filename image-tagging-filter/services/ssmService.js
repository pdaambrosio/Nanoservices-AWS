const AWS = require("aws-sdk");
const ssmClient = new AWS.SSM({
  apiVersion: "2014-11-06",
  region: "us-east-1",
});

module.exports.getParameter = (address) => {
  return new Promise((resolve, reject) => {
    ssmClient.getParameter(
      {
        Name: address,
        WithDecryption: true,
      },
      (err, data) => {
        if (err) {
          return reject(err);
        }
        return resolve(data.Parameter.Value);
      }
    );
  });
};
