## DOCKERFILE

Dockerfile is a document which contains the commands/specifications to be used to build animage
It is used with the build context, which is the where the source code is located on the local host. So it uses
the build context to build our specified image.
Within your build context, we can have the `.dockerignore` file to tell docker which files to not copy
to docker env

### Core things about the dockerfile
- Start with your Operating system:
- Install language runtime
- Install dependencies
- Setup execution environment
- Run application



