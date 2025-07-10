FROM python:3.11-slim

# Set working directory
WORKDIR /opt/dbt

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install dbt-postgres>=1.7.0 dbt-core>=1.7.0 psycopg2-binary>=2.9.0 python-dotenv>=1.0.0

# Copy dbt project files
COPY . .

# Create a non-root user
RUN useradd -m -u 1003 dbt_user && \
    chown -R dbt_user:dbt_user /opt/dbt

USER dbt_user

# Default command (can be overridden)
CMD ["tail", "-f", "/dev/null"]  # Keep container alive 