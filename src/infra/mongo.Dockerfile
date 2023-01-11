FROM mongo



COPY ./src/mongoDB/cfg-files/init.cfg /tmp/bash-scripts/init.cfg
COPY ./src/mongoDB/bash-scripts/init.sh /tmp/bash-scripts/init.sh



RUN chmod +x /tmp/bash-scripts/init.sh
WORKDIR /tmp/bash-scripts/
# CMD [ "bash", "init.sh" ]

