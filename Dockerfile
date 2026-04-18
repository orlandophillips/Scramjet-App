FROM node:18-alpine

# Set environment to production
ENV NODE_ENV=production
# Force the port to 8080 as required by Back4app
ENV PORT=8080 

WORKDIR /app

# 1. Use a wildcard to make package-lock.json optional
COPY package*.json ./

# 2. Install build tools ONLY if necessary (for bcrypt/native modules)
# If your app is simple, you can remove the next line to save space
RUN apk add --no-cache python3 make g++

# 3. Install dependencies
RUN npm install --omit=dev

# 4. Copy the rest of the code
COPY . .

# 5. Correct the path to your entry point (usually index.js, not src/index.js)
EXPOSE 8080

# Use CMD instead of ENTRYPOINT for simpler cloud deployments
CMD ["node", "index.js"]
