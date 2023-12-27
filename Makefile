.PHONY: all build run ip clean
all: build run ip

build:
	@docker build -t ssh-mock .

run:
	@docker run --name ssh-mock --rm --detach -it ssh-mock

ip: 
	@echo "IP address:"
	@docker inspect --format '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ssh-mock
	@echo ""
	@echo "For connect to mock ssh use command bellow:"
	@echo ""
	@echo "	ssh user@`docker inspect --format '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ssh-mock`"
	@echo ""
	@echo "... and password 'secret'"

clean:
	@docker stop ssh-mock 2> /dev/null; echo "ok"
	@docker rm ssh-mock 2> /dev/null; echo "ok"
	@docker rmi ssh-mock 2> /dev/null; echo "ok"

