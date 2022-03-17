const { Client } = require('@elastic/elasticsearch');

const Client = new Client({
  apiVersion: "7.10",
  host: "http://localhost:9200"
});

module.exports.index = async (document) => {
    await Client.index({
        index: "images",
        type: "object",
        body: document
    })
};