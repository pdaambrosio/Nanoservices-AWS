const AWS = require('aws-sdk');
const dynamodb = new AWS.DynamoDB.DocumentClient({region: 'us-east-1'});

const { Client } = require('@elastic/elasticsearch')
const client = new Client({
  apiVersion: "7.10",
  host: 'http://localhost:9200'
})

module.exports.consumer = async (event) => {
  return {
    statusCode: 200,
    body: JSON.stringify(
      {
        message: 'Go Serverless v1.0! Your function executed successfully!',
        input: event,
      },
      null,
      2
    ),
  };

  // Use this code if you don't use the http event with the LAMBDA-PROXY integration
  // return { message: 'Go Serverless v1.0! Your function executed successfully!', event };
};
