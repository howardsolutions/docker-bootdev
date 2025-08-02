# DOCKER Course Notes

## Couple Moving Parts to Keep in mind

1. The "Docker server" or "Docker Daemon". 

This listens to requests from the desktop app and executes them. 

If this isn't running NOTHING ELSE will work.

2. The "Docker Desktop" GUI. 

Starting the GUI should start the server, at least that's how I usually ensure the server is running. 

The GUI is the VISUAL way to interact with Docker.

3. The Docker CLI. 

As a developer, most of your work will be interacting with Docker via the CLI. 

I'd recommend using the GUI to visualize what's going on with Docker, but executing most of your commands through the command line.

## What Is Docker?

Docker makes development efficient and predictable

takes away repetitive, mundane configuration tasks and is used throughout the development lifecycle for fast, easy and portable application development – desktop and cloud.

Put simply: Docker allows us to deploy our applications inside "containers", which are kind of like very lightweight virtual machines. 

Instead of just shipping an application, we can ship an application and the environment it runs in.

## Docker Hub

- is the official cloud service for storing and sharing Docker images

```
"For most of my career, if my company used AWS to deploy, we used AWS to host our images. If we used GCP to deploy, we hosted images on GCP. I'd usually just use whatever's most convenient and cost effective, the features are very similar between providers."
```