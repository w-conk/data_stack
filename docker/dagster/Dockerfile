FROM python:3.11-slim

# Set working directory
WORKDIR /opt/dagster

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install dagster>=1.11.0 dagster-webserver>=1.11.0 dagster-postgres>=0.27.0 dagster-dbt>=0.27.0 dagster-dlt>=1.5.0 psycopg2-binary>=2.9.0 python-dotenv>=1.0.0

# Copy Dagster code
COPY . .

# Create a non-root user
RUN useradd -m -u 1004 dagster_user && \
    chown -R dagster_user:dagster_user /opt/dagster

USER dagster_user

# Expose the Dagster UI port
EXPOSE 3000

# Start Dagster UI
CMD ["dagster", "dev", "-h", "0.0.0.0", "-p", "3000"] 