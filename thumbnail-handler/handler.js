const thumbnailService = require('./services/thumbnailService');

module.exports.thumbnail = async (event) => {
  console.log('SNS event received successfully:', JSON.stringify(event));
  await thumbnailService.thumbnail(event)

  return {message: 'Thumbnail executed successfully!', event};
};
