const AWS = require("aws-sdk");
const rekognition = new AWS.Rekognition({ region: "us-east-1" });

module.exports.data = (bucket, key) => {
  return new Promise((resolve, reject) => {
    rekognition.detectLabels(
      {
        Image: {
          S3Object: {
            Bucket: bucket,
            Name: key,
          },
        },
        MinConfidence: 80,
        MaxLabels: 6,
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
