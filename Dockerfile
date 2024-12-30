FROM node:14
WORKDIR /opt
ADD . /opt
RUN npm install
ENTRYPOINT npm run start
