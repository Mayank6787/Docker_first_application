# Operating system for our application
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
