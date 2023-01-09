FROM mongo

COPY ./src/mongoDB/cfg-files/config.cfg /tmp/bash-scripts/config.cfg
COPY ./src/mongoDB/bash-scripts/config.sh /tmp/bash-scripts/config.sh


RUN chmod +x /tmp/bash-scripts/config.sh

WORKDIR /tmp/bash-scripts/
ENTRYPOINT mongod --configsvr --replSet cfgrs --bind_ip 0.0.0.0 --port 27017
# CMD [ "bash", "config.sh" ]

