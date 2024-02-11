FROM ubuntu

RUN apt-get update
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_18.x  | bash -
RUN apt-get upgrade -y
RUN apt-get install -y nodejs


WORKDIR /app


COPY package.json package.json
COPY package-lock.json package-lock.json


#RUN cd app
# only_run we change any dependencies not code optimization
RUN npm install 

COPY main.js main.js

# it coppies all the files so we need ignore file docker ignore to  avoid_node_modules.
#COPY . .  

ENTRYPOINT [ "node","main.js" ]

