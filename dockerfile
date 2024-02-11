FROM ubuntu as build

RUN apt-get update
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_18.x  | bash -
RUN apt-get upgrade -y
RUN apt-get install -y nodejs
RUN apt-get install -y Typescript


WORKDIR /app


COPY package.json package.json
COPY package-lock.json package-lock.json


#RUN cd app
# only_run we change any dependencies not code optimization
RUN npm install 

#build
RUN tsc -p . 

COPY main.js main.js

# it coppies all the files so we need ignore file docker ignore to  avoid_node_modules.
#COPY . .  




# stage 2


FROM node as runner

WORKDIR /app

COPY --from=build app/ .

ENTRYPOINT [ "node","main.js" ]