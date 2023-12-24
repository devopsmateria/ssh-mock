# Dockerized Ubuntu with SSH Server for Debugging Tasks

This repository contains a Dockerfile for building a Docker image based on Ubuntu 22.04 that includes an SSH server. It is designed to be used for debugging tasks, allowing you to create a mock container with SSH and experiment.

## Usage

### Build the Docker Image

```bash
make build
```

### Run the Container

```bash
make run
```

This command will run the container named "ssh-mock" in the background.

### Obtain the Container's IP Address

```bash
make ip
```

This command will display the IP address of the running "ssh-mock" container.

### Clean Up

```bash
make clean

```
This command will stop and remove the "ssh-mock" container, as well as delete the Docker image.

## Dockerfile

The Dockerfile included in this repository configures the Ubuntu 22.04 image with an SSH server. The default login credentials for SSH are:

- **Username**: `user`
- **Password**: `secret`

By default, the SSH server is started when the container runs. You can uncomment the ENTRYPOINT line in the Dockerfile to start SSH along with another service if needed.

```dockerfile
# Uncomment for run with another service
#ENTRYPOINT service ssh start && bash

CMD ["/usr/sbin/sshd", "-D"]
```

Feel free to modify the Dockerfile according to your specific requirements.

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.
