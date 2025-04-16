## Persisting Data in Docker Containers
By default, when a container is removed, its content which are ephemeral are lost.
When working with Docker containers, it is important to manage data persistence, especially when dealing
with databases or applications that require storing data outside the container's lifecycle. Docker
containers are ephemeral, meaning that once they are removed, the data stored inside them
is also lost. To persist data, Docker provides two primary options: Volumes and Bind Mounts.
Before jumping into the different ways to persist data, you have to know that if you want data to persist, 
instead of removing the data, you just need to stop the container and you can jump back in anytime.But this
isnot always desirable. If you are sure of the things you need to be avaialable in the container at runtime
we can always build our own image from the image attaching the data we need and all containers we get from
that image will have the data inbuilt.
TO do this, for example we can;
```bash
docker build --tag my-ubuntu-image /path/to/Dockerfile
```
### where;
- my-ubuntu-image = the image tag we are creating
- /path/to/dockerfile = path to my dockerfile which includes the commands to probably install the dependencies
needed.
An example dockerfile can be 
```
# Use the official Ubuntu base image
FROM ubuntu:22.04

# Update package list and install iputils-ping
RUN apt update && apt install -y iputils-ping
```
Asides this, there are some data which we might be aware of at runtime but inside the container AND we still
need these data to persist. For instance changes made to the db when user makes some requests will need to
persist in the db. For things like this we use volume mount

### Volumes
- What are Volumes?
Volumes are managed by Docker and stored outside the container's filesystem. They are ideal for persisting
 data across container restarts and removals. Volumes are stored in Docker's default storage location
 and are not tied to any specific container.

When to Use Volumes
- When you need Docker-managed storage: Volumes are the preferred way to persist data because Docker
 handles them and stores them outside of the container.

- When you need portability: Volumes can be shared between containers, which allows data to persist even
 if containers are removed or recreated.

- When you don't need to directly interact with the host filesystem: Volumes are managed by Docker, so
 they don’t require you to specify paths on the host machine.
### Creating a Volume
To create a volume, we can or use the command
```
docker volume create <volumn-name>
```

### Volume Mount Examples
1. To persist a file created in a container when we access another container
```bash
docker run -it --rm --mount source=my-volumn,target=/my-data/,type=volume ubuntu:22.04
```
It is advisable to specify the type but the default if not specified is volume
Also the target could also be *destination* or *des*
After creating a container using this command above, we can create a file under the my-data dir
```bash
echo "hello world" > my-data/hello.txt
```
you can verify the `hello world` exists in the file hello.txt by running the cat /my-data/hello.txt. 
After verifying, you can exit the container and spin up another container mounting the same volumn
```bash
docker run -it --rm --mount source=my-volumn,destination=/my-data/ ubuntu:22.04
```
When you enter the shell interactive session and run the command
```bash
cat my-data/hello.txt
```
You will see the output `hello world` printed

2. To persist data in a PostgreSQL container using a volume, run the following command:

```bash
docker run -d --name postgres-container -v my_postgres_data:/var/lib/postgresql/data postgres
```

In this example:

my_postgres_data is the name of the volume.

/var/lib/postgresql/data is the path inside the container where the PostgreSQL data is stored.

Even if the postgres-container is stopped or removed, the data will persist in the my_postgres_data volume.

To inspect and manage volumes, use:

```bash
docker volume ls      # List all volumes
docker volume inspect my_postgres_data   # Inspect a specific volume
```
- To navigate into the docker vm shell, you can rrun this command
```bash
docker run -it --rm --privileged --pid=host justincormack/nsenter1
```
 THis commands spin up a container with enough privileges (--privileged, --pid=host) to "enter" the host
 VM's namespaces.

Then to see the volumes you have stored on the docker disk, you can cd into the dir
```bash
cd var/lib/docker/volumes
```
### Bind Mounts
What are Bind Mounts?
Bind mounts link a specific directory on your host machine to a directory inside the container. This allows you to persist data on the host filesystem and directly modify files inside the container. Bind mounts are ideal for situations where you need to access the host machine’s files or when you want changes made locally (on your host) to reflect inside the container.

When to Use Bind Mounts
When you need to access local files: Bind mounts are useful if you want to link a specific directory on your host machine to a container directory. This is helpful for cases where you need to share code or configurations between your host and container.

When developing code in real-time: If you're actively developing code (e.g., a web application) and want changes on your local machine to immediately reflect inside the container, bind mounts are the way to go.

Bind Mount Examples
1. I can just bind mount a dir from my host filesystem and make changes to it and see it reflect in my
 container and vice versa
To start we need to choose a path on the host file to bind mount. I will choose `${pwd}/my-data`
```bash
docker run -it --rm -mount type=bind,source="${PWD}"/my-data/,destination=/my-data/ ubuntu:22.04
```
After this command, the destination or target will contain what ever is in the source folder. YOu can test this
by creating a file either locally or in a container and see it in the other location. And as long as we 
mount the same credentials, it would persist across different containers

2. To mount a local directory (/path/to/your/code) into a container running a web application:

```bash
docker run -d -v /path/to/your/code:/app my-web-app
```

In this example:

/path/to/your/code is a directory on your host machine.

/app is the path inside the container where the application’s files are stored.

Changes made on your local /path/to/your/code directory will immediately reflect inside the container’s /app directory.

To use bind mounts for local development environments, this approach is especially useful for scenarios where:

You want to edit source code on your local machine and have it automatically available in your container.

You need to keep specific configurations (e.g., .env files) in sync between the container and your host machine.

Key Differences Between Volumes and Bind Mounts
Feature	Volumes	Bind Mounts
Location	Stored in Docker-managed storage	Stored on the host filesystem
Docker Management	Managed and handled by Docker	Directly controlled by the host
Use Case	Best for persistent data (e.g., DBs)	Best for accessing or sharing files between host and container
Performance	Generally optimized by Docker	Performance may vary based on host filesystem
Portability	Easily portable between containers	Tied to the host machine and path
Conclusion
Use Volumes when you need Docker to handle the data persistence, especially for database storage and when you don't want to manage host directories directly.

Use Bind Mounts when you need to sync files between your host and container, such as in development environments where you want immediate reflection of code changes inside the container.

Both methods provide a reliable way to persist data beyond the lifecycle of a container. Choose the one that best fits your use case!
