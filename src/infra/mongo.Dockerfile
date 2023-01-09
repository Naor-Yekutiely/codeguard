FROM mongo



COPY ./src/mongoDB/cfg-files/init.cfg /tmp/bash-scripts/init.cfg
COPY ./src/mongoDB/bash-scripts/init.sh /tmp/bash-scripts/init.sh



RUN chmod +x /tmp/bash-scripts/init.sh
WORKDIR /tmp/bash-scripts/
ENTRYPOINT mongod --shardsvr --bind_ip 0.0.0.0 --port 27017 --replSet rs0 
# RUN  bash init.sh

