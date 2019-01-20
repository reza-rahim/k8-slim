var Prometheus = require("prometheus-client")

client = new Prometheus();

module.exports = {
    connections: client.newCounter({
        namespace: "mean_app",
        name: "new_connections",
        help: "The number of new connections."
    }),
    connectedUsers: client.newGauge({
        namespace: "mean_app",
        name: "active_connections",
        help: "The number of active connections."
    })
}

client.listen(7071);
