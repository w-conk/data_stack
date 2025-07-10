-- PostgreSQL initialization script for data stack
-- This runs when the PostgreSQL container starts up

-- Create dev database
CREATE DATABASE data_stack_dev;

-- Create prod database
CREATE DATABASE data_stack_prod;

-- Connect to dev database and set up schemas
\c data_stack_dev;

-- Create schemas for dev database
CREATE SCHEMA IF NOT EXISTS staging;
CREATE SCHEMA IF NOT EXISTS marts;
CREATE SCHEMA IF NOT EXISTS intermediate;

-- Grant permissions to our user on dev database
GRANT ALL PRIVILEGES ON DATABASE data_stack_dev TO data_stack_user;
GRANT ALL PRIVILEGES ON SCHEMA public TO data_stack_user;
GRANT ALL PRIVILEGES ON SCHEMA staging TO data_stack_user;
GRANT ALL PRIVILEGES ON SCHEMA marts TO data_stack_user;
GRANT ALL PRIVILEGES ON SCHEMA intermediate TO data_stack_user;

-- Grant permissions on all tables in dev database schemas
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO data_stack_user;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA staging TO data_stack_user;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA marts TO data_stack_user;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA intermediate TO data_stack_user;

-- Grant permissions on future tables in dev database
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO data_stack_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA staging GRANT ALL ON TABLES TO data_stack_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA marts GRANT ALL ON TABLES TO data_stack_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA intermediate GRANT ALL ON TABLES TO data_stack_user;

-- Connect to prod database and set up schemas
\c data_stack_prod;

-- Create schemas for prod database (only marts for production)
CREATE SCHEMA IF NOT EXISTS marts;

-- Grant permissions to our user on prod database
GRANT ALL PRIVILEGES ON DATABASE data_stack_prod TO data_stack_user;
GRANT ALL PRIVILEGES ON SCHEMA public TO data_stack_user;
GRANT ALL PRIVILEGES ON SCHEMA marts TO data_stack_user;

-- Grant permissions on all tables in prod database schemas
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO data_stack_user;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA marts TO data_stack_user;

-- Grant permissions on future tables in prod database
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO data_stack_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA marts GRANT ALL ON TABLES TO data_stack_user;

-- Connect back to default database for status table
\c data_stack;

-- Create a simple test table to verify the setup
CREATE TABLE IF NOT EXISTS public.data_stack_status (
    id SERIAL PRIMARY KEY,
    service_name VARCHAR(50) NOT NULL,
    status VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert initial status
INSERT INTO public.data_stack_status (service_name, status) 
VALUES ('postgres', 'initialized')
ON CONFLICT DO NOTHING; 