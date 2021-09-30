const AWS = require('aws-sdk');
const uuid = require('uuid/v4');

const S3 = new AWS.S3();
const BUCKET = 'http-handler-images';

AWS.config.update({
    region: 'us-east-1'
});

const upload = body => {
    const id = uuid();
    return new Promisse((resolv, reject) => {
        S3.putObject({
            Bucket: BUCKET,
            Key: id + '.jpg',
            Body: new Buffer(body.replace(/^data:image\/\w+;base64,/, ""),'base64'),
            ContentType: 'image/jpeg',
            ContentEncoding: 'base64'
        }, (err) => {
            if (err) {
                return reject(err);
            }
            return resolv({
                bucket: BUCKET,
                key: id + '.jpg'
            });
        });
    });
}

module.exports = {
    upload: upload
}
