# Use official Node.js image as the base image
FROM node:16

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the Vue.js application
RUN npm run build

# Install a lightweight HTTP server to serve the app
RUN npm install -g serve

# Expose the port the app will run on
EXPOSE 5000

# Command to run the app using 'serve' on port 5000
CMD ["serve", "-s", "dist", "-l", "5000"]
