## 🚀🚀 Dockerization of node js application 🚀🚀

Step-1: Create a node application in your repective project folder using command 

Step-2: Run this command
```ruby
npm install 
```


Step-3: Install express by running this command 

```ruby
npm i express 
```

Step-4: Create main.js and Go to my application in github and copy the main.js file code to your main.js

Step-5: Create a file called as "Dockerfile":
-----------
Definition: A Dockerfile is a text document that contains all the commands a user could call on the command line to assemble an image
Insert the given command below in your docker file. 
-----------

```ruby
 Operating system for our application
FROM ubuntu

# Update 
RUN apt-get update
# Install curl
RUN apt-get install -y curl
#Select a  node version to run
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
# Upgrade the node js 
RUN apt-get upgrade -y
# Install node js version v18.0.0
RUN apt-get install -y nodejs

# Now i am adding app/  every where so the shortcut for this is 
WORKDIR /app

# COPY source  destination 
COPY package.json package.json
COPY package-lock.json package-lock.json

# npm i will run inside a container and install node modules
RUN  npm install


# You can use COPY  . . to directly include all the files 
# Only problem arises is that it will copy node module and package file agiain also 
# To solve this problem you can creat another .dockerignore file
# COPY main.js main.js

COPY main.js main.js 


# 
ENTRYPOINT [ "node", "main.js" ]
```



Step-6: As i have mentioned above the COPY main.js code you need to create a .dockerignore file , yes this file is same as .gitignore 
which tell the docker to igonre files , so file like node_modules does not need to be included in your docker image. 

--Because we are using RUN npm install command in the Dockerfile , so lets move on 

!!!! NOTE: In the my application there is a file called as "docker-compose.yml" no need to create that file now we will learn the docker-compose in another repository !!!!




Step-7:
## Don't want to publish image  
------------
if you don't want to publish your image on the docker hub then just run this command 

```ruby
docker build -t [image_name] 
```


image_name -> anything of your choice 
NOTE: Running for the first time it will take some time so have patience 😄

NOTE: Suppose you have changed something in your code , like installed a extra package or whatever and you want docker to 
also save this changes then again run the above command docker build -t [image_name] 

Then open your terminal and run this command to see the application running !!! 


```ruby
docker run -it -p 8000:8000 [image_name] 
```


Then open [localhost:8000] on your laptop or computer to see this message. 

"Hey , I am a docker container v5"
🎊🎊 Congratulations for running your own custom image , 🔥🔥

------------


## Want to publish image --> 

Go to docker hub [https://www.docker.com/products/docker-hub/] create your own account and then create a repository (I hope you have created your repository and if you don't know how to then watch youtube its a 2 min work ) 
So next what ever be your docker hub repository name build your project on top of that !!! 

```
docker build -t [docker_hub_id/name][image_name]
```


