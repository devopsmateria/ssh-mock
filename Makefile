.DEFAULT-GOAL := run
.PHONY: default
default: run

build:
	docker build -t ssh-mock .

run: build
	docker run --name ssh-mock --rm --detach -it ssh-mock

ip: 
	docker inspect --format '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ssh-mock

clean:
	docker stop ssh-mock 2> /dev/null; echo "ok"
	docker rm ssh-mock 2> /dev/null; echo "ok"
	docker rmi ssh-mock 2> /dev/null; echo "ok"

