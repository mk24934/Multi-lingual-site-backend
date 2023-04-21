FROM ubuntu:22.04

# Install necessary tools
RUN apt-get update && \
    apt-get install -y curl && \
    apt-get install -y git && \
    apt-get install -y gnupg

# Install Node.js and npm
RUN curl -sL https://deb.nodesource.com/setup_lts.x | bash -
RUN apt-get install -y nodejs

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Install dev-dependencies
RUN npm install --only=dev

# Copy the rest of the application files to the container
COPY . .

# Expose the port that the application listens on
EXPOSE 3000

# Start the application
CMD ["npm", "run", "start"]
