.PHONY: clean restart restart_force start run build install

start: build
	docker-compose up

build: install
	yarn run build
	yarn run build-dep
	
install: 
	yarn install

run: build
	yarn start

restart_force: build
	docker-compose build
	docker-compose up

restart:
	docker-compose up --force-recreate

clean:
	git checkout lib/tetris/build pages/tetris.html
	git clean -f
	rm -rf node_modules/

