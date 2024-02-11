FROM ubuntu

RUN apt-get update
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_18.x  | bash -
RUN apt-get upgrade -y
RUN apt-get install -y nodejs

COPY package.json /app/package.json
COPY package-lock.json /app/package-lock.json


#RUN cd app
# only_run we change any dependencies not code optimization
RUN cd app && npm install 

COPY main.js /app/main.js

# it coppies all the files so we need ignore file docker ignore to  avoid_node_modules.
#COPY . .  

ENTRYPOINT [ "node","app/main.js" ]

