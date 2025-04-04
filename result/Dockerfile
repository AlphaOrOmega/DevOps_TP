FROM node:18-slim
COPY . /result
WORKDIR /result
RUN apt-get update && apt-get install npm
RUN npm install -g nodemon && npm ci && npm cache clean --force
RUN mv /usr/local/app/node_modules /node_modules
ENV PORT=3000
CMD ["node", "server.js"]
