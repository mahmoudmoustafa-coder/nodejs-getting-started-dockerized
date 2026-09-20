# Node.js Getting Started — Dockerized

A simple Node.js web application containerized with Docker as a hands-on DevOps project.

This project is based on the original [Heroku Node.js Getting Started](https://github.com/heroku/nodejs-getting-started) application.

The main goal of this project is to practice containerizing an existing Node.js application using Docker and applying basic container best practices.

---

## Project Overview

The original Node.js application was taken and Dockerized without changing its core functionality.

This project demonstrates:

- Writing a Dockerfile for a Node.js application
- Building a Docker image
- Running the application inside a container
- Managing container ports
- Using `.dockerignore`
- Installing dependencies with `npm ci`
- Running the application as a non-root user
- Verifying the application through container logs and HTTP requests

---

## Tech Stack

| Technology | Purpose |
|---|---|
| Node.js | Runtime environment |
| Express | Web framework |
| Docker | Application containerization |
| npm | Dependency management |
| Git / GitHub | Version control |

---

## Docker Configuration

The project uses:

```text
node:24-bookworm-slim
```

as the base image.

The Dockerfile:

1. Uses a lightweight Node.js base image
2. Sets `/app` as the working directory
3. Copies `package.json` and `package-lock.json`
4. Installs dependencies using `npm ci`
5. Copies the application source code
6. Runs the application as the `node` user
7. Exposes port `5006`
8. Starts the application with `npm start`

---

## Project Structure

```text
.
├── Dockerfile
├── .dockerignore
├── .gitignore
├── package.json
├── package-lock.json
├── index.js
├── public/
├── views/
└── README.md
```

---

## Run with Docker

### Build the Docker Image

```bash
docker build -t nodejs-getting-started .
```

### Run the Container

```bash
docker run -d \
  --name nodejs-app \
  -p 5006:5006 \
  nodejs-getting-started
```

### Verify the Container

```bash
docker ps
```

### Open the Application

```text
http://localhost:5006
```

Or test it with:

```bash
curl http://localhost:5006
```

### View Container Logs

```bash
docker logs nodejs-app
```

Expected output includes:

```text
Listening on 5006
```

---

## Container Management

### Stop the Container

```bash
docker stop nodejs-app
```

### Remove the Container

```bash
docker rm nodejs-app
```

### List Docker Images

```bash
docker images
```

---

## Run Without Docker

To run the application locally:

```bash
npm install
npm start
```

Then open:

```text
http://localhost:5006
```

---

## `.dockerignore`

The project uses `.dockerignore` to exclude unnecessary files from the Docker build context.

Current exclusions:

```text
node_modules
.git
.env
npm-debug.log
```

This helps keep the build context smaller and prevents unnecessary files from being sent during the Docker build.

---

## Dockerfile

```dockerfile
FROM node:24-bookworm-slim

WORKDIR /app

COPY package*.json ./

RUN npm ci

COPY . .

USER node

EXPOSE 5006

CMD ["npm", "start"]
```

---

## What I Practiced

Through this project I practiced:

- Dockerfile instructions
- Docker build context
- Docker image layers and caching
- Docker images and containers
- Port mapping
- Container logs
- `.dockerignore`
- Dependency installation with `npm ci`
- Running containers as a non-root user
- Git and GitHub workflow

---

## Original Project

This project is based on:

https://github.com/heroku/nodejs-getting-started

The Docker configuration and containerization work were added as part of this project.

---

## Author

**Mahmoud Moustafa**

Computer Science Student | Aspiring DevOps Engineer

GitHub:  
https://github.com/mahmoudmoustafa-coder
