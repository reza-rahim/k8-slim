var express = require('express');
var router = express.Router();
var Kafka = require('node-rdkafka');

var brokerlist=process.env.KAFKA_BROKER_LIST;

var producer = new Kafka.Producer({
     'metadata.broker.list': brokerlist
});

producer.connect();

var topic="message";
var partition=-1;
var key=1;


router.post('/', function(req, res, next){

  try{
    //console.log(req.body.msg)

    var queuedSuccess = producer.produce(topic, partition, new Buffer(req.body.msg), key);
    key++;

    if (queuedSuccess) {
      //console.log('We queued our message!');
    } else {
      res.status(400);
      res.json({ "status": "internal error"});
    }

    res.status(200);
    res.json({ "status": "success"});

  } catch (err) {
      //console.log('bad message ');
      res.status(400);
      res.json({ "status": "bad message"});
  }
});

module.exports = router;
