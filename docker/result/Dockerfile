FROM node:18-slim
WORKDIR /usr/local/app
COPY . /usr/local/app

RUN npm install -g nodemon && npm ci && npm cache clean --force
RUN mv /usr/local/app/node_modules /node_modules

CMD ["node", "server.js"]
