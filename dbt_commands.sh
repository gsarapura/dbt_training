dbt run
# MODELNAME: no need to write .sql
dbt run --select MODELNAME
dbt show --select MODELNAME 


dbt compile --select dim_customers

# Generate docs and review them (lineage)
dbt docs generate
dbt docs serve --port 8081

Execute dbt test to run all generic and singular tests in your project.
Execute dbt test --select test_type:generic to run only generic tests in your project.

Execute dbt test --select test_type:singular to run only singular tests in your project.

dbt test --select source:jaffle_shop -- when running in souce file
