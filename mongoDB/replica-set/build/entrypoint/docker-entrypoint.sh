#!/bin/bash

sleep 10

mongo --host primary <<EOF
rs.initiate(
  {
    _id : "$REPLICASET_NAME",
    members: [
      { _id : 0, host : "$primary_IP:27017" },
      { _id : 1, host : "$secondary_01_IP:27017" },
      { _id : 2, host : "$secondary_02_IP:27017" }
    ]
  }
)
EOF