const elasticsearch = require("@elastic/elasticsearch");

const client = new elasticsearch.Client({
  apiVersion: "7.10",
  node: "https://vpc-elk-images-wya4akkrwhq2qouvel7zymsea4.us-east-1.es.amazonaws.com",
});

module.exports.search = async (query) => {
  await client.search({
    index: "images",
    q: "tags:" + query,
  });
};
