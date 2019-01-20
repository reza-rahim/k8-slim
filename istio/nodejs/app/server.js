const express = require('express');
const path = require('path');
const app = express();

const monitor = require('./monitor.js');

// make node_redis promise compatible

// connect to Redis

/*
 * Define app routes and reponses
 */


app.get('/', (req, res) => {
    monitor.connections.increment();
    res.sendFile('index.html', {
        root: path.join(__dirname, 'views')
    });
});

/*
 * Run app
 */
const port = process.env.port || 3000;

app.listen(port, () => {
    console.log(`App listening on port ${port}!`)
});
