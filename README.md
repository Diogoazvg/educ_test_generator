# README

# EN
## Used technologies
- Ruby version 3.2.3
- Rails 7.0.5.
- PostgreSQL.
- Elasticsearch.
- Many other gems.

## Configuration
  - Necessary file .env in root path of project such as below.
     - Can you find a copy as `.example.env` in the project root path.
    ```ruby
      DB_USERNAME=postgres
      DB_PASS=postgres
      SECRET_KEY=394763f4126b4e49765466787a66000820fd259c6

      # Enable to run web app from local or disable to run from docker.
      DB_HOST=localhost
    ```
  - RUN `bundle install`
  - RUN `docker-compose build`

* Database creation
  - RUN `docker-compose run web rails db:create db:migrate`

* How to run the test suite
  - RUN `docker-compose run web bundle exec rake test`

* Deployment instructions
  - Then steps above, should RUN `docker-compose up` or RUN `docker-compose up -d`
  - Then can you access localhost:3000 in your prefered browser.

* This app using Elasticsearch for searchs.
