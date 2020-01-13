Set up process
1. Create schema 'moneytracker'
2. Run mvn -Pdevelopment resources:resources liquibase:update -X
3. Add some data manually using update.sql