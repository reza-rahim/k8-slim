
var redis = require('redis');
var chunk = require('chunk');
const bluebird = require("bluebird");

//export redisHost="redis"
var redisHost = process.env.redisHost || 'localhost';
var redisPort = parseInt(process.env.redisPort) || 6379;

console.log("conneting to " + redisHost + ":" + redisPort )

var redisClient = redis.createClient({host : redisHost, port : redisPort});

bluebird.promisifyAll(redis.RedisClient.prototype);
bluebird.promisifyAll(redis.Multi.prototype);

module.exports.redisClient =  redisClient


