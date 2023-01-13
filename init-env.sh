#!/bin/zsh

# create env file
echo "=============>CREATING ENVIRONMENT FILE..."
ENV_CUSTOM = "DATABASE_USER=root                         
DATABASE_PASSWORD=password
DATABASE_HOST=db"
echo $ENV_CUSTOM >> .env

# create rails project
echo "=============>CREATING RAILS PROJECT..."
docker-compose run app rails new . --force --database=mysql --skip-bundle
sudo chown -R $USER .

# CHANGE DB info in database.yml file:
echo "=============>CHANGING DB CONFIG IN database.yml file..."
sed -i -e 's/username: root/username: <%= ENV["DATABASE_USER"] %>/g' config/database.yml
sed -i -e 's/password:$/password: <%= ENV["DATABASE_PASSWORD"] %>/g' config/database.yml
sed -i -e 's/host: localhost/host: <%= ENV["DATABASE_HOST"] %>/g' config/database.yml

# #build composes
echo "=============>BUILDING COMPOSE..."
docker-compose build

# #init db
echo "=============>INITIAL DB..."
docker-compose run app rake db:create
docker-compose run app rake db:migrate
docker-compose run app rake db:seed

# run compose
# echo "=============>RUNNING DOCKER..."
# docker-compose up