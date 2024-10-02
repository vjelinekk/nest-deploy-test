# Stage 1: Development Stage
FROM node:18-alpine AS development

# Install NestCLI globally
RUN npm install -g @nestjs/cli

# Set working directory
WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install

# Copy application code
COPY . .

# Expose the application port
EXPOSE 3000

# Command to run the application in development mode
CMD ["npm", "run", "start:dev"]


# Stage 2: Production Stage
FROM node:18-alpine AS production

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install only production dependencies
RUN npm install --production

# Copy the build output from development stage
COPY --from=development /app/dist ./dist

# Expose the application port
EXPOSE 3000

# Command to run the application in production mode
CMD ["node", "dist/main"]