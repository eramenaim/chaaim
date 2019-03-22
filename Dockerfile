FROM node:10.15.3-alpine

ENV NODE_ENV production
ENV TEST_FILES=test.js

WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
RUN npm install --production --silent && mv node_modules ../

COPY . .

RUN node ${TEST_FILES}

EXPOSE 8080
CMD npm start