const AWS = require('aws-sdk');

const s3 = new AWS.S3({apiVersion: '2006-03-01', region: 'us-east-1'});
const bucketS3 = 'thumbnail-handler-images';

module.exports.getObject = (bucket, key) => {
    return new Promise((resolve, reject) => {
        s3.getObject({
            Bucket: bucket,
            Key: key
        }, (err, data) => {
            if (err) {
                return reject(err);
            }
            return resolve(data.Body);
        })
    });
}

module.exports.putObject = (buffer, filename) => {
    return new Promise((resolve, reject) => {
        s3.putObject({
            Bucket: bucketS3,
            Key: filename,
            Body: buffer
        }, (err) => {
            if (err) {
                return reject(err);
           }
           return resolve({
               bucket: bucketS3,
               key: filename
           });
        })
    });
}
