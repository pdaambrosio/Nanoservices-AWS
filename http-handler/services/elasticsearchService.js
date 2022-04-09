const elasticsearch = require("@elastic/elasticsearch");
const AWS = require("aws-sdk");

const getEndPoint = async (address) => {
  return new Promise((resolve, reject) => {
    const ssmClient = new AWS.SSM({
      apiVersion: "2014-11-06",
      region: "us-east-1",
    });

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

const client = new elasticsearch.Client({
  apiVersion: "7.10",
  node: await getEndPoint("/general/elasticsearch-endpoint"),
});

module.exports.search = async (query) => {
  await client.search({
    index: "images",
    q: "tags:" + query,
  });
};
