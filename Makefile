build:
	docker compose build --no-cache

up:
	docker compose up

down:
	docker compose down

install:
	docker compose run --rm web bundle install

init:
	make pre-commit
	make install
	make build
	make up

db-create:
	docker compose run web rake db:create

db-migrate:
	docker compose run --rm web bundle exec rails db:migrate

db-reset:
	docker compose run --rm web bundle exec rails db:migrate:reset
	docker compose run --rm web bundle exec rails db:seed

db-rollback:
	docker compose run --rm web bundle exec rails db:rollback

db-seed:
	docker compose run --rm web bundle exec rails db:seed

rubocop:
	docker compose run --rm web bundle exec rubocop -D -E -S -P

rubocop-A:
	docker compose run --rm web bundle exec rubocop -A
