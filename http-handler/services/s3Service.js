const AWS = require('aws-sdk');
const uuid = require('uuid');

const bucket = 'http-handler-images';
const s3 = new AWS.S3({apiVersion: '2006-03-01', region: 'us-east-1'});

const upload = body => {
    const id = uuid();
    return new Promise((resolve, reject) => {
        s3.putObject({
            Bucket: bucket,
            Key: id + '.jpg',
            Body: body,
            ContentType: 'image/jpeg',
            ContentEncoding: 'base64'
        }, (err) => {
            if (err) {
                return reject(err);
            }
            return resolve({
                bucket: bucket,
                key: id + '.jpg'
            });
        });
    });
}

module.exports = {
    upload: upload
}
