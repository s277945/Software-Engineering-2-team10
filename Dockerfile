FROM node:latest
RUN mkdir -p /client
COPY ./client/package.json /client/package.json
RUN cd /client && npm install
RUN mkdir -p /server
COPY ./server/package.json /server/package.json
RUN cd /server && npm install
COPY . .
EXPOSE 3000
WORKDIR /
CMD npm start --prefix ./server & npm start --prefix ./client