const AWS = require('aws-sdk');

const s3 = new AWS.S3({apiVersion: '2006-03-01', region: 'us-east-1'});
const bucket = 'thumbnail-images';

module.exports.getObject = (bucket, key) => {
    return new Promisse((resolve, reject) => {
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
            Bucket: bucket,
            Key: 'thumbnail-' + filename,
            Body: buffer
        }, (err, data) => {
            if (err) {
                return reject(err);
           }
           return resolve(data);
        })
    });
}

// const getObject = (bucket, key) => {
//     return new Promisse((resolve, reject) => {
//         s3.getObject({
//             Bucket: bucket,
//             Key: key
//         }, (err, data) => {
//             if (err) {
//                 return reject(err);
//             }
//             return resolve(data.Body);
//         })
//     });
// }

// module.exports = {
//     getObject: getObject
// }