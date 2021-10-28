const thumbnailService = require('./services/thumbnailService');

module.exports.thumbnail = async (event) => {
  console.log('SNS event received successfully:', JSON.stringify(event));
  await thumbnailService.thumbnail(event)

  return {message: 'Go Serverless v1.0! Your function executed successfully!', event};
};
