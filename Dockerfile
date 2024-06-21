FROM node:alpine

# Expose Port
# for local
# EXPOSE ${BACKEND_PORT}
# for k8s
EXPOSE 3890

# Use latest version of npm
#RUN npm i npm@latest -g
# Install app dependencies
RUN npm install --only=production &&  \
    npm cache clean --force
 
# Stage 2: Final Stage
FROM node:alpine
 
# Expose port
EXPOSE 3890
 
# Set working directory
WORKDIR /app
#for local
# COPY backend/package*.json ./
#for k8s
COPY /package*.json ./
# RUN npm install
RUN npm install --no-optional && npm cache clean --force
# If you are building your code for production
# RUN npm ci --only=production
# Bundle app source
#for local
# COPY backend/. .
#for k8s
COPY . .

# Start command (CMD[""] is the default command that will be run when the container is started)
CMD [ "node", "app.js"]