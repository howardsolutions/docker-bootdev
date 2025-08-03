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
<hr />

# CONTAINERS

-  is a standard unit of software that packages up code and all its dependencies so the application runs quickly and reliably from one computing environment to another.

- We've had virtual machines (like VirtualBox) for a long time. The trouble with virtual machines is that they're SLOW as h*ck. Booting one up usually takes LONGER than a physical machine.

- Containers, on the other hand, gives us 90% of the benefits of virtual machines, but are SUPER lightweight. 

Containers boot up in SECONDS, while virtual machines can take minutes.

## Why Are Containers Lightweight?

- Virtual machines virtualize hardware, they emulate what a physical computer does at a LOW level.

![Virtual Machine Architecture](images/virtual-machine-architecture.png)


- Containers virtualize at the operating system level. Isolation between containers that are running on the SAME machine is still really good.

- For the most part, each container feels like it has its own operating and filesystem. In reality, a lot of resources are being shared, but they're being shared securely through namespaces.

![Container Architecture](images/container-architectures.png)

<hr />

# IMAGES

- Container: an INSTANCE of a virtualized read-write environment

- Image: A READ-ONLY DEFINITION of a CONTAINER, a definition of the APP and EVERYTHING it needs to run.

- A CONTAINER is basically an IMAGE that's ACTIVELY RUNNING.

In other words, you BOOT up a CONTAINER FROM an IMAGE.

- You can create multiple separate CONTAINERS all from the SAME IMAGE (it's kinda like the relationship between classes and objects).

## Running A Container 

```zsh
    docker run -d -p hostport:containerport namespace/name:tag
```

- `-d`: Run in detached mode (doesn't block your terminal)
- `-p`: Publish a container's port to the host (forwarding)
- `hostport`: The port on your local machine
- `containerport`: The port inside the container
- `namespace/name`: The name of the image (usually in the format username/repo)
- `tag`: The version of the image (often latest)


## Stop a Container 

- `docker stop`: This stops the container by issuing a SIGTERM signal to the container. 

You'll typically want to use docker stop.

- `docker kill`: This stops the container by issuing a SIGKILL signal to the container. 

This is a more forceful way to stop a container, and should be used as a last resort.

## VOLUMES

By DEFAULT, Docker containers DON'T RETAIN any state from past containers. For example, if I:

1. Start a container from an image
2. Make some changes to the filesystem (like installing a new package) in that container
3. Stop the container
4. Start a new container from the same image
5. The new container does not have the changes I made in step 2.

<p>
However, if I restart the stopped container, it will have the changes I made. This is only worth mentioning because sometimes developers think that killing an old container and starting a new one is the same as restarting a process - but that's not true... it's more like resetting the state of the entire machine to the original image.
</p>


- Docker does have ways to support "persistent state" through `STORAGE VOLUMES`.

- They're basically a filesystem that lives outside of the container, but can be accessed by the container.