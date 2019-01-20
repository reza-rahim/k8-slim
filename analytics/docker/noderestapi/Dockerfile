FROM node

RUN apt-get update
RUN apt-get install -y  build-essential
RUN apt-get install -y libsasl2-dev
RUN npm install node-rdkafka
RUN npm install
COPY app /app
WORKDIR /app

