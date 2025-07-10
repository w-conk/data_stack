# Data Stack with dlt, dbt, Evidence, and Dagster

A complete data stack implementation with:
- **dlt**: Data loading into PostgreSQL
- **dbt**: Data transformation
- **Evidence**: Data visualization (coming soon)
- **Dagster**: Orchestration
- **Docker**: Containerization

## Architecture

```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│    dlt      │───▶│ PostgreSQL  │───▶│    dbt      │───▶│  Evidence   │
│ (Data Load) │    │  Database   │    │(Transform)  │    │(Visualize)  │
└─────────────┘    └─────────────┘    └─────────────┘    └─────────────┘
       │                   │                   │                   │
       └───────────────────┼───────────────────┼───────────────────┘
                           │                   │
                    ┌─────────────┐    ┌─────────────┐
                    │  Dagster    │    │   Docker    │
                    │(Orchestrate)│    │(Containerize)│
                    └─────────────┘    └─────────────┘
```

## Quick Start

1. **Clone and setup**:
   ```bash
   git clone <your-repo>
   cd data_stack
   ```

2. **Start the stack**:
   ```bash
   docker-compose up -d
   ```

3. **Access services**:
   - Dagster UI: http://localhost:3000
   - Evidence: http://localhost:3001
   - PostgreSQL: localhost:5432

## Project Structure

```
data_stack/
├── dlt/                    # Data loading with dlt
│   ├── pipelines/         # dlt pipelines
│   └── requirements.txt
├── dbt/                   # Data transformation with dbt
│   ├── models/
│   ├── seeds/
│   └── dbt_project.yml
├── evidence (coming soon)/              # Data visualization
│   ├── pages/
│   └── package.json
├── dagster/               # Orchestration
│   ├── assets/
│   └── definitions.py
├── docker/                # Docker configurations
│   ├── dlt/
│   ├── dbt/
│   └── evidence/
├── docker-compose.yml     # Main orchestration
└── README.md
```

## Services

### 1. dlt (Data Loading)
- Loads data from various sources into PostgreSQL
- Supports 100+ connectors
- Handles schema evolution automatically

### 2. dbt (Data Transformation)
- Transforms raw data into analytics-ready models
- Implements data quality tests
- Generates documentation

### 3. Evidence (Data Visualization, coming soon)
- Open-source BI tool
- SQL-first approach
- Real-time dashboards

### 4. Dagster (Orchestration)
- Schedules and monitors data pipelines
- Provides observability
- Handles dependencies between jobs

### 5. PostgreSQL (Database)
- Stores raw and transformed data
- Supports JSON and structured data

## Development

### Adding new data sources
1. Create a new dlt pipeline in `dlt/pipelines/`
2. Add corresponding dbt models in `dbt/models/`
3. Create Evidence pages in `evidence/pages/`
4. Update Dagster assets in `dagster/assets/`

### Running locally
```bash
# Start all services
docker-compose up -d

# View logs
docker-compose logs -f

# Stop all services
docker-compose down
```

## Configuration

All configuration is done through environment variables in `docker-compose.yml`:
- Database credentials
- API keys
- Service ports
- Resource limits

## Monitoring

- Dagster UI provides pipeline monitoring
- PostgreSQL logs available via Docker
- Evidence dashboards show data freshness
