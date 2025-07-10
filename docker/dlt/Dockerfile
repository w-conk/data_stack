FROM python:3.11-slim

# Set working directory
WORKDIR /opt/dlt

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install dlt[postgres]>=0.4.0 psycopg2-binary>=2.9.0 requests>=2.31.0 python-dotenv>=1.0.0

# Copy dlt code
COPY . .

# Create a non-root user
RUN useradd -m -u 1002 dlt_user && \
    chown -R dlt_user:dlt_user /opt/dlt

USER dlt_user

# Default command (can be overridden)
CMD ["tail", "-f", "/dev/null"]  # Keep container alive 