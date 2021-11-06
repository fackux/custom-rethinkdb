FROM ubuntu:20.04
EXPOSE 28015 29015 8080
COPY ./data/*.json /data/
WORKDIR /data
RUN apt-get update
RUN apt-get install gnupg2 wget -y
RUN echo "deb https://download.rethinkdb.com/repository/ubuntu-focal focal main" | tee /etc/apt/sources.list.d/rethinkdb.list
RUN wget -qO- https://download.rethinkdb.com/repository/raw/pubkey.gpg | apt-key add -
RUN apt-get update
RUN apt-get install rethinkdb -y
#RUN wget -qO- https://deb.nodesource.com/setup_14.x | sh
#RUN apt-get install -y nodejs
CMD ["rethinkdb", "--initial-password", "jep666A", "--bind", "all", "-n", "RethinkDB-Custom"]