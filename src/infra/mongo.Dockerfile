FROM mongo



COPY ./src/mongoDB/cfg-files/mongo-init.cfg /tmp/bash-scripts/mongo-init.cfg
COPY ./src/mongoDB/bash-scripts/init_data.sh /tmp/bash-scripts/init_data.sh



RUN chmod +x /tmp/bash-scripts/init_data.sh
WORKDIR /tmp/bash-scripts/
ENTRYPOINT mongod --shardsvr --bind_ip 0.0.0.0 --port 27017 --replSet rs0 
CMD [ "bash", "init_data.sh" ]

