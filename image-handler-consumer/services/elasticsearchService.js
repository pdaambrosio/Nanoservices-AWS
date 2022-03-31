const elasticsearch = require("@elastic/elasticsearch");

const client = new elasticsearch.Client({
  apiVersion: "7.10",
  node: "https://vpc-elk-images-wya4akkrwhq2qouvel7zymsea4.us-east-1.es.amazonaws.com",
});

module.exports.index = async (document) => {
  await client.index({
    index: "images",
    type: "object",
    body: document,
  });
};
