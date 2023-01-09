FROM mongo

COPY ./src/mongoDB/cfg-files/mongo_config.cfg /tmp/bash-scripts/mongo_config.cfg
COPY ./src/mongoDB/bash-scripts/cfg-server.sh /tmp/bash-scripts/cfg-server.sh


RUN chmod +x /tmp/bash-scripts/cfg-server.sh

WORKDIR /tmp/bash-scripts/
ENTRYPOINT mongod --configsvr --replSet cfgrs --bind_ip 0.0.0.0 --port 27017
CMD [ "bash", "cfg-server.sh" ]

