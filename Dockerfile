FROM node:10.3.0

RUN apt update && apt install -y git python && rm -r /var/lib/apt/lists/*

RUN npm install -g bower karma gulp pm2
