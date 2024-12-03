# Stage 1: Build the Next.js app
FROM node:22-alpine AS builder

# Set the working directory
WORKDIR /app

RUN npm install --global yarn

# Install dependencies and generate package-lock.json
COPY package.json yarn.lock ./
RUN yarn install

# Generate Prisma client and build the Next.js app
RUN yarn build-web 

# Stage 2: Run the Next.js app in production
FROM node:20-alpine AS runner


WORKDIR /app
# Set environment variable for production
ENV NODE_ENV=production

# Install necessary dependencies for Expo and web platform
RUN apt-get update && \
    apt-get install -y git python3 build-essential && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY server.ts ./
# Copy the necessary files from the build stage
COPY --from=builder /app/dist /app/dist
COPY --from=builder /app/prisma /app/prisma
COPY --from=builder /app/package.json /app/package.json

# Install Express
RUN npm i -D express compression morgan

# Expose the port that the web app will run on
EXPOSE 3000

# Start the Expo web server along with Express
CMD ["node", "server.js"]
