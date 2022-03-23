const s3Service = require("./services/s3Service.js");
const dynamodbService = require("./services/dynamodbService");

module.exports.upload = async (event) => {
  const result = await s3Service.upload(event.body);
  await dynamodbService.put(result);

  return {
    statusCode: 201,
    body: JSON.stringify(result),
  };
};

module.exports.get = async (event) => {
  const result = await s3Service.upload(event.body);
  await dynamodbService.put(result);

  return {
    statusCode: 201,
    body: JSON.stringify(result),
  };
};
