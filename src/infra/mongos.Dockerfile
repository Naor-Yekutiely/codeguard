FROM mongo


COPY ./src/mongoDB/cfg-files/mongos.cfg /tmp/bash-scripts/mongos.cfg
COPY ./src/mongoDB/bash-scripts/mongos.sh /tmp/bash-scripts/mongos.sh



RUN chmod +x /tmp/bash-scripts/mongos.sh

WORKDIR /tmp/bash-scripts/
CMD mongos --configdb cfgrs/mongo_cfgserv:27017 --bind_ip 0.0.0.0 --port 27017
# CMD [ "bash", "mongos.sh" ]

