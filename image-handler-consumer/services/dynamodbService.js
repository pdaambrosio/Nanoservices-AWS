const AWS = require('aws-sdk');
const dynamodb = new AWS.DynamoDB.DocumentClient({region: 'us-east-1'});

const table = 'images';

module.exports.put = (item) => {
    return new Promise((resolve, reject) => {
        dynamodb.put({
            TableName: table,
            Item: {
                id: item.key,
                bucket: item.bucket
            }
        }, (err, data) => {
            if (err) {
                return reject(err);
            }
            return resolve(data);
        })
    });
};

module.exports.getItem = (item) => {
    return new Promise((resolve, reject) => {
        dynamodb.get({
            TableName: table,
            Key: {
                id: item.key
            },
            ConsistentRead: true
        }, (err, data) => {
            if (err) {
                return reject(err);
            }
            return resolve(data.Item);
        })
    });
};
