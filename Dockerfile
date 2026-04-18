FROM node:18-alpine

# Set production environment
ENV NODE_ENV=production
ENV PORT=8080

WORKDIR /app

# Copy package files (wildcard makes lockfile optional)
COPY package*.json ./

# Install only production dependencies
RUN npm install --omit=dev

# Copy the rest of the application
COPY . .

# Match the port Back4app is pinging
EXPOSE 8080

# Based on your file structure, the entry point is in src/index.js
CMD ["node", "src/index.js"]
