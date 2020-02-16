run:
	yarn run start

build:
	yarn run build
build-prod:
	yarn run 

dev: build run
dev-start:
	yarn run start

install-dep:
	npm install yarn -g
	yarn install

docker-build-dev:
	yarn run build
	docker build -t usap:dev .

docker-build-prod:
	yarn run build
	docker build -t usap:prod .

docker-run-dev:
	docker run -v ${PWD}:/app -v /app/node_modules -p 3000:80 --rm usap:dev

docker-run-prod:
	docker run -v ${PWD}:/app -v /app/node_modules -p 5000:80 --rm usap:prod

docker-dev:  docker-build-dev docker-run-dev  
docker-prod: docker-build-prod docker-run-dev

all: install-dep build run


