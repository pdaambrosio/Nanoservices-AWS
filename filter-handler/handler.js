const filterService = require('./services/filterService');

module.exports.filter = async (event) => {
  console.log('SNS event received successfully:', JSON.stringify(event));
  await filterService.filter(event)

  return {message: 'Filter executed successfully!', event};
};
