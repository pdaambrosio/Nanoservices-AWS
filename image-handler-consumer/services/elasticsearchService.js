const { Client } = require("@elastic/elasticsearch");

const elastic = new Client({
  apiVersion: "7.10",
  host: "http://localhost:9200",
});

module.exports.index = async (document) => {
  await elastic.index({
    index: "images",
    type: "object",
    body: document,
  });
};
