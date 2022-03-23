const { Client } = require("@elastic/elasticsearch");

const elastic = new Client({
  apiVersion: "7.10",
  host: "http://localhost:9200",
});

module.exports.search = async (query) => {
  await elastic.search({
    index: "images",
    q: "tags:" + query,
  });
};
