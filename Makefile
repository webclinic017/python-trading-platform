.PHONY: build

setup: create-env init

create-env:
	python3 -m venv env

install:
	./env/bin/python3 -m pip install $(package)

uninstall:
	./env/bin/pip3 uninstall $(package)

lock:
	./env/bin/pip3 freeze > requirements.txt

list:
	./env/bin/pip3 list

init:
	./env/bin/pip3 install -r requirements.txt

test:
	./execute_test.sh 

docker-build:
	docker build -t ptp:v1.0 .

docker-run:
	docker run -v ${PWD}/data:/app/data -d -p 8080:8080 --name ptp ptp:v1.0

docker: docker-build docker-run

docker-stop:
	docker stop ptp && docker rm ptp

fill-orders:
	./execute.sh ./src/infrastructure/cli/cli.py fill-orders

start-server:
	./execute.sh ./src/infrastructure/http/server.py