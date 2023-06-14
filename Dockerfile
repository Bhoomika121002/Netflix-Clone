# Use a base image with Node.js installed
FROM node:14

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Expose the port on which the application will run
EXPOSE 3000

# Set the command to start the application
CMD ["npm", "start"]
