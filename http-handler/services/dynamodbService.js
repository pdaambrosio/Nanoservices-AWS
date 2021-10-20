const AWS = require('aws-sdk');
const dynamodb = new AWS.DynamoDB.DocumentClient({region: 'us-east-1'});

const table = 'images';

const put = item => {
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
}

module.exports = {
    put: put
}
