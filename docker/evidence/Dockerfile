FROM node:18-alpine

# Set working directory
WORKDIR /opt/evidence

# Copy package files first for better caching
COPY package*.json ./

# Install Node.js dependencies
RUN npm ci --legacy-peer-deps

# Copy Evidence application code
COPY . .

# Create a non-root user
RUN addgroup -g 1001 evidence_user && \
    adduser -D -s /bin/sh -u 1001 -G evidence_user evidence_user && \
    chown -R evidence_user:evidence_user /opt/evidence

USER evidence_user

# Expose the Evidence UI port
EXPOSE 3000

# Start Evidence development server
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0", "--port", "3000"] 