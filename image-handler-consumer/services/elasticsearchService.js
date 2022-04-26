const elasticsearch = require("@elastic/elasticsearch");
const AWS = require("aws-sdk");
const ssmClient = new AWS.SSM({
  apiVersion: "2014-11-06",
  region: "us-east-1",
});

module.exports.getEndPoint = (address) => {
  return new Promise((resolve, reject) => {
    ssmClient.getParameter(
      {
        Name: address,
        WithDecryption: true,
      },
      (err, data) => {
        if (err) {
          return reject(err);
        }
        return resolve(data.Parameter.Value);
      }
    );
  });
};

const elasticNode = async () => {
  const response = await this.getEndPoint("/general/elasticsearch-endpoint");
  const client = new elasticsearch.Client({
    apiVersion: "7.10",
    node: String(`https://${response}`),
  });
  return client;
};

module.exports.index = async (document) => {
  await elasticNode().then((client) => {
    client.index({
      index: "images",
      type: "object",
      body: document,
    });
  });
};
