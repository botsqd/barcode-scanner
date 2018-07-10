FROM mhart/alpine-node:8 AS build

WORKDIR /app
COPY . .

# If you have native dependencies, you'll need extra tools
# RUN apk add --no-cache make gcc g++ python

RUN npm install --production
RUN npm run build

FROM alpine:3.6
RUN apk add --update bash openssl nginx

WORKDIR /app
CMD nginx -c /nginx.conf

RUN apk update
RUN apk add nginx
ADD nginx.conf /
ENTRYPOINT []

COPY --from=build /app/dist /app

EXPOSE 80
