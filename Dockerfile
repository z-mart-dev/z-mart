FROM node:alpine as build
COPY . /opt
WORKDIR /opt
RUN yarn install && yarn build

FROM nginx:alpine
COPY --from=build /opt/build /usr/share/nginx/html
