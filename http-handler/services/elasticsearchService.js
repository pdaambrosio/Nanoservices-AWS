const elasticsearch = require("@elastic/elasticsearch");
const AWS = require("aws-sdk");
const ssm = new AWS.SSM({ region: "us-east-1" });

const getElasticSearchEndpoint = async () => {
  const endpoint = await ssm
    .getParameter({
      Name: "/general/elasticsearch-endpoint",
      WithDecryption: true,
    })
    .promise();
  return endpoint.Parameter.Value;
};

const client = new elasticsearch.Client({
  apiVersion: "7.10",
  node: getElasticSearchEndpoint(),
});

module.exports.search = async (query) => {
  await client.search({
    index: "images",
    q: "tags:" + query,
  });
};
