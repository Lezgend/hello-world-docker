# Hello World Docker
Ultra-Lightweight Hello World Dockerized in 22.4 kB
```bash
→ docker image ls
REPOSITORY                           TAG       IMAGE ID       CREATED         SIZE
ghcr.io/lezgend/hello-world-docker   v1.0.0    48b245d19756   7 minutes ago   22.4kB
```

## ✨ Features
- 🛠 Ridiculously Small: Just 22.4KB—smaller than a single web page!
- ⚡ Blazing Fast: Near-instant startup for demos, microservices, or inspiration.
- 🎓 Educational Value: Perfect for learning minimal Docker builds with scratch.

## 🌱 Getting Started

### 💡 Prerequisites

- [Docker](https://www.docker.com/get-started) installed on your machine.

### Clone the Repository

```bash
git clone https://github.com/Lezgend/hello-world-docker.git && cd hello-world-docker
```

### Pull the Docker Image

For x86_64 architecture and arm64 architecture (e.g., macOS M1/M2):
```bash
docker pull ghcr.io/lezgend/hello-world-docker:v1.0.0
```

### Run the Application

Start the container using Docker:
```bash
docker run -d --rm --name hello-world -p 8080:80 docker pull ghcr.io/lezgend/hello-world-docker:v1.0.0
```

The application will be accessible at `http://localhost:8080`.

---

## 🌱 Getting Started with Docker Compose

### Create `docker-compose.yaml` File
In the root of your project directory, create a `docker-compose.yaml` file with the following content:
```yaml
services:
  hello-world:
    image: ghcr.io/lezgend/hello-world-docker:v1.0.0
    container_name: hello-world
    restart: always
    ports:
      - 8080:80
```

### Start the Application with Docker Compose
Run the following command to start the application:
```bash
docker compose up -d
```

---

## 🔧 Building Locally

Follow these steps to build and run the Docker image locally.

### 💡 Prerequisites

- Ensure [Docker](https://www.docker.com/get-started) is installed on your system.

### Steps to Build and Run

1. Clone the repository:
  ```bash
 git clone https://github.com/Lezgend/hello-world-docker.git && cd hello-world-docker
  ```
2. Build and start the Docker container:
  ```bash
  docker compose up -d
  ```
3. Access the application in your web browser at:
  ```
  http://localhost:8080
  ```

## 🤝 Contributing

Contributions are welcome! Feel free to submit issues or pull requests to improve the project.

## 📜 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## 🌍 Why This Exists
This project celebrates the beauty of simplicity and optimization in containerized applications. A must-see for Docker minimalists and efficiency enthusiasts!

---
