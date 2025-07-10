from dagster import Definitions

from assets.assets import all_assets

# Define the Dagster application
defs = Definitions(
    assets=all_assets,
    resources={},
) 