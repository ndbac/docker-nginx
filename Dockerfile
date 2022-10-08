FROM node:15

WORKDIR /app

COPY package.json .

ARG NODE_ENV
RUN if [ "$NODE_ENV" = "development" ]; \
        then yarn install; \
        else yarn install --only=production; \
        fi

COPY . ./

EXPOSE $PORT

CMD ["node", "index.js"]
