🐳 Docker Basics & Internals
📦 What is Docker?
Docker is a platform that allows you to package, distribute, and run applications in containers. Containers are lightweight, fast,
 and isolated environments that work consistently across different systems.

🧱 Evolution: Bare Metal ➡️ VMs ➡️ Containers
Era	Description
Bare Metal	Applications run directly on physical machines. No isolation.
VMs	Full operating systems run on a hypervisor. Better isolation, but heavy.
Containers	Lightweight OS-level virtualization. Share the host OS kernel, but still isolated.
📘 Key Concepts
🔹 Docker Image
A blueprint or class in OOP terms.

Contains everything needed to run the app: code, dependencies, libraries.

🔹 Docker Container
A running instance of an image.

Think of it like an object (instance) created from a class.

🧠 What Makes a Container?
🧭 Namespaces
Provide isolation:

PID Namespace: isolates process trees (each container starts from PID 1).

Network Namespace: isolates network interfaces, ports, etc.

Mount Namespace: isolates file systems.

Others: IPC, UTS (hostname), etc.

🧠 "Containers can't see each other’s processes or networks due to namespaces."

📊 Control Groups (cgroups)
Control resource usage (CPU, memory, I/O).

Prevents one container from starving others.

📁 Filesystem Boundary
Each container has its own filesystem (based on the image).

Completely isolated from host and other containers unless volumes are mounted.

🧪 Summary Example
You run a Django app in a Docker container.

It runs in its own isolated PID + network + filesystem.

The container is restricted to 1 CPU and 256MB RAM via cgroups.

It thinks it's the only thing running, even though 10 other containers exist.


## 🧱 Docker Networking: Bridge Network Explained

When Docker containers are launched, they can communicate with each other depending on the network they are attached to. One common and default type of network Docker uses is the **bridge network**.

---

### 📦 What is a Bridge Network?

A **bridge network** is a private internal network created by Docker on the host. It allows containers to communicate with each other and the outside world through NAT (Network Address Translation).

Each container on a bridge network gets:
- Its own **unique internal IP address**
- Access to other containers on the same bridge
- A route to the outside internet (via the host)

---

### 🧠 How Bridge Networking Works

1. When a container is started without any custom network, it is automatically connected to the **default `bridge` network**.
2. Docker assigns each container a **unique IP address** within this bridge network (e.g., `172.17.0.X`).
3. Containers on the same bridge can:
   - **Communicate with each other** via internal IPs or container names (if DNS is enabled)
   - **Access the internet** via the host's external network interface
4. Containers **cannot access containers on a different bridge network** unless specifically configured to do so.

---

### 🚧 Why IP Conflicts Don’t Happen

Even when containers are on the same bridge network:
- Docker ensures **each container gets a unique IP**
- This avoids IP conflicts
- **Namespaces** (like the network namespace) ensure **containers are isolated** and unaware of other networks or host IPs

---

### 🧪 Example

```bash
# Start two containers on the default bridge network
docker run -dit --name container1 nginx
docker run -dit --name container2 nginx
```

# Inspect the network
docker network inspect bridge

You will see:

container1 might have IP 172.17.0.2

container2 might have IP 172.17.0.3

They can ping each other within the bridge using their IPs or names

🧩 Summary
Feature	Bridge Network
Default?	✅ Yes
IP assignment	Unique per container
Inter-container comms	✅ Yes (same bridge only)
Internet access	✅ Yes (via host NAT)
Isolation	✅ Network namespaces

✅ Docker Installation Test
To confirm Docker is working properly, run the following command:

```bash
docker run hello-world
```

🧠 What This Does:
Step 1: Docker client contacts the Docker daemon.

Step 2: Docker downloads the hello-world image from Docker Hub (if not already cached).

Step 3: A new container is created from the image.

Step 4: The container runs a small program that outputs a confirmation message.

Step 5: The Docker daemon sends this output back to your terminal.

✅ Output Sample:
```bash
Hello from Docker!
This message shows that your installation appears to be working correctly.
```

