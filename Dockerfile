#You write a Dockerfile in your IDE -> build a docker image -> Run docker container

#In terminal, run ~ docker build -t node-app:1.0 . 
#t as tag; node-app as the application name; 1.0 as a tag(version); the "." refers to starting from current directory, which is the Dockerfile

#In terminal, run ~ docker images
#you will see the image built, with the tag information as well as the packages downloaded in docker hub

#In terminal, run ~ docker run -d -p 3000:3000 node-app:1.0
# 3000 as the host port, 9000 as the docker container port
#if failed with port is already allocated, run ~ docker ps    or    ~ docker container ls, listing out all the running container 

#In terminal, run ~ docker rm -f <container name that is blocking the port>
#, run ~ docker run -d -p 3000:3000 node-app:1.0              again then you will see the message in server.js being printed on localhost:3000


FROM node:19-alpine
#node as the base docker image, it's equivalent as install node
COPY package.json /app/ 
#"COPY" the 'package.json' from local to container 'app'
COPY src /app/
#"COPY" the src directory from local to container 'app'

WORKDIR /app
#equivalent as cd, which will change into the 'app' container directory, set this path as a default location
RUN npm install
#"RUN" will execute any command in a shell inside a docker container environment
CMD ["node", "server.js"]
#CMD as command to start the application 