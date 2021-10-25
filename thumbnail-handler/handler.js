module.exports.thumbnail = async (event) => {
  console.log('SNS event received successfully:', JSON.stringify(event));
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
};
