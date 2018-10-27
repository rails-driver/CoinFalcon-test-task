# CoinFalcon test task

### Up and run
```bash
docker-compose up -d
docker-compose exec web sh -c 'bundle'
docker-compose exec web sh -c 'rake db:migrate'
docker-compose exec web sh -c 'rails s'
docker-compose exec web sh -c 'sidekiq'
```

### Tests
Prepare database
```bash
docker-compose exec web sh -c 'RAILS_ENV=test rake db:create'
```

Run tests
```bash
docker-compose exec web sh -c 'rspec'
```

### API documentation
Please visit `http://localhost:3000/apipie` to see documentation.