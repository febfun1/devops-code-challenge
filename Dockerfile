FROM node:14
#ENV NODE_OPTIONS="--openssl-legacy-provider"
# WORKDIR /app

# Create a directory for the app
RUN mkdir -p /usr/src/backend
RUN mkdir -p /usr/src/frontend

# Copy built frontend application
COPY frontend/build/ /usr/src/frontend

# Copy built backend application
COPY backend/ /usr/src/backend

# Set the working directory
WORKDIR /usr/src/backend

# Copy the package.json and package-lock.json
COPY backend/package*.json ./

# Install frontend dependencies
RUN npm install
RUN npm ci


# Copy the rest of the application code
COPY backend/. .


# Expose port for the frontend
EXPOSE 8080

# Start the backend
#CMD ["npm", "start"]

#set the working directory 
WORKDIR /usr/src/frontend

# Copy the package.json and package-lock.json
COPY backend/package*.json ./

# Install the app dependencies
RUN npm install
RUN npm ci

# Copy the rest of the application code
COPY frontend/. .

# Build the app
RUN npm run build

# Expose the port
EXPOSE 3000

# Start the application
#CMD ["npm", "ci"]
#CMD ["npm", "start"]
WORKDIR /usr/src/backend
CMD ["sh", "-c", "npm run start && cd /usr/src/frontend && npm run start"]
