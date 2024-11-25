# Step 1: Use a minimal Node.js base image
FROM node:18-alpine AS base

# Step 2: Set the working directory
WORKDIR /app

# Step 3: Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Step 4: Install only production dependencies
RUN npm install --only=production

# Step 5: Copy application source code
COPY . .

# Step 6: Expose the application port
EXPOSE 3000

# Step 7: Run the application
CMD ["node", "app.js"]