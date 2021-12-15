const rekognitionService = require("./services/rekognitionService.js");

module.exports.tag = async (event) => {
    const s3Info = JSON.parse(event.Records[0].Sns.Message);
    const bucket = s3Info.Records[0].s3.bucket.name;
    const key = s3Info.Records[0].s3.object.key;
    const data = await rekognitionService.data(bucket, key);

    console.log(data.Labels);
};
