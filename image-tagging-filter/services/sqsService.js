const AWS = require("aws-sdk");
const sqs = new AWS.SQS({ apiVersion: "2012-11-05", region: "us-east-1" });

module.exports.putMessage = (message) => {
  return new Promise((resolve, reject) => {
    sqs.sendMessage(
      {
        QueueUrl:
          "https://sqs.us-east-1.amazonaws.com/489716104000/post-processing-image-queue",
        MessageBody: JSON.stringify(message),
      },
      (err, data) => {
        if (err) {
          return reject(err);
        }
        return resolve(data);
      }
    );
  });
};
