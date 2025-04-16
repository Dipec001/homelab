# Docker Commands

## 1. List All Containers (Running and Stopped)
```bash
docker ps -a
```
This command lists all containers (both running and stopped), showing container IDs, image names, and their current status.

2. Remove a Stopped Container
```bash
docker rm <container-id>
```
Use this command to remove a stopped container. Replace <container-id> with the actual container ID or name. For example:

```bash
docker rm vigilant_goldwasser
```
3. Run a Docker Container
```bash
docker run <image-name>
```
This command is used to create and run a new container from a specified image. For example:

```bash
docker run hello-world
```
4. List Running Containers Only
```bash
docker ps
```
This command lists only the containers that are currently running.

5. Remove a Running Container
```bash
docker rm -f <container-id>
```
The -f (force) flag removes a running container by force. Use this carefully, as it will stop the container before removing it.

6. View Container Logs
```bash
docker logs <container-id>
```
This command shows the logs of a specific container. Replace <container-id> with the actual ID of the container you want to view logs for.

7. Stop a Running Container
```bash
docker stop <container-id>
```
This command stops a running container gracefully.

8. Start a Stopped Container
```bash
docker start <container-id>
```
This command starts a container that was previously stopped.

9. Remove an Image
```bash
docker rmi <image-id>
```
This command removes a Docker image from your local machine.

10. View Running Docker Images
```bash
docker images
```
This command lists all the images available locally on your machine.

11. Run with Interactive Terminal
```bash
docker run -it <image-name> /bin/bash
```
Runs a container in interactive mode with a terminal. Useful for debugging or working inside containers.

12. Detached Mode (Run in Background)
```bash
docker run -d <image-name>
```
Starts a container in the background (detached).

13. Run and Map Ports
```bash
docker run -p <host-port>:<container-port> <image-name>
```
Maps a container port to a port on your host machine.
Example:

```bash
docker run -p 5432:5432 postgres
```
14. Set Environment Variables
```bash
docker run -e VAR_NAME=value <image-name>
```
Sets environment variables for the container.
Example:

```bash
docker run -e POSTGRES_PASSWORD=secret postgres
```
15. Mount a Volume (Data Persistence)
```bash
docker run -v <volume-name>:<container-path> <image-name>
```
Mounts a Docker-managed volume for persistent storage.
Example:

```bash
docker run -v pgdata:/var/lib/postgresql/data postgres
```

16. Bind Mount (Host ↔ Container Sync)
```bash
docker run -v /path/on/host:/path/in/container <image-name>
```
Mounts a host directory directly into the container.
Example:

```bash
docker run -v $(pwd):/app node
```
⚠️ Use for development: changes on host reflect immediately inside the container.

17. Automatically Remove Container After Exit
```bash
docker run --rm <image-name>
```
Deletes the container automatically once it exits. Useful for short-lived processes.

18. Name a Container
```bash
docker run --name <custom-name> <image-name>
```
Gives your container a specific name, making it easier to manage.

19. Start an Existing (Stopped) Container
```bash
docker start <container-id or name>
```
This restarts a container that was previously stopped without creating a new one.

20. Attach to a Running Container
```bash
docker attach <container-id or name>
```
This lets you interact with a container's ongoing process — kind of like plugging into its terminal.
 Press *Ctrl + P* followed by *Ctrl + Q* to detach without stopping the container.

Note: Avoid attaching to containers that are already connected to another terminal/session unless you're
 sure — it might create conflicts.

