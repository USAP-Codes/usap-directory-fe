# stage 0, build and compile frontend
# base image
FROM node:10.16.3-alpine as build-stage
LABEL maintainer "Felix Gondwe<gondwefelix8@gmai.com>"

RUN apk update \
    && apk add --virtual build-dependencies \
        nginx \
        git \
        gcc \
        git \
        wget \
        curl \
        make
# setup nginx
#RUN adduser -g 'Nginx www user' -h /
# set working directory
WORKDIR /app

# copy sourcecode
COPY . .

# build 
RUN make install-dep


#stage 1, run application with nginx.useful in production
FROM nginx:1.15

COPY --from=build-stage /app/dist /usr/share/nginx/html
# copy default nginx config
COPY --from=build-stage /app/nginx/nginx.conf /etc/nginx/conf.d/default.conf


