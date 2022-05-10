const AWS = require("aws-sdk");
const ssm = require("./ssmService");
const sqs = new AWS.SQS({ apiVersion: "2012-11-05", region: "us-east-1" });

const ssmGetParameter = async (address) => {
  const response = await ssm.getParameter(address);
  return response;
};

module.exports.putMessage = async (message) => {
  const sqsUrl = await ssmGetParameter("/general/sqs-url");
  return new Promise((resolve, reject) => {
    sqs.sendMessage(
      {
        QueueUrl: sqsUrl,
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
