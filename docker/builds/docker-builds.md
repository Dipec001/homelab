## DOCKERFILE
A dockerfile is a document that contains specifications or list of commands that will be executed to build
an image. It usually works together with a build context which is the source code on the local host. The
build context can also be a link to the source code. I.e a github repo link
YOu can specify a `.dockerignore` to specify which contents of the source code should not be copied into
docker

## Dockerfile recipes 😊
- Start with the operating system
- install the language runtime 
- install the package dependencies
- Setup execution envt
- Run app

## Some important things to consider when building 
- THe entire process runs in layers as specified in the dockerfile and one layer builds on the next so
it is always advisable to join like layers today
- By default the commands are being cached, to speed up the process, it is always good to avoid invalidating
the cache as much as we can.

## Mutli Stage builds
Multi stage builds is where we have multiple stages in a single Dockerfile that are building separate images.
It is particularly useful for compiled languages like Go where it is first compiled into a single binary.
And the compiler or source code for the first build/compilation isnt really need , just the single binary
so the end product from the later stage is a tiny, production-ready image.

## General Principles
These are the general principles to consider when doing any docker builds
----------------------
Legends
- Build Speed: THe speed with which we can build the image
- Security: THe security of the image
- Clarity: THe clarity for future developers usign your dockerfile
----------------------

- Pin specific versions within our build. Specify versions for base images, system dependencies like from apt
and application dependencies like from within requirements.txt
- check for the smallest and most secure based images to use
_ Protect layer cache so that future builds can leverage ont he  cache. We can make this efficient by following
the following;
. Order commands based on change frequency
. First copy dependencies file, install dependencies then copy the restof the code
.  USe cache mounts
. COmbine steps that are always linked. Use heredocs to write multi line commands which are treated as single
. USe the COPY --Link (especially used in multi stage builds)
- set workdir 
- indicate the standard ports to expose
- use ENv variables
- avoid unnecessary files using the .dockerignore file 
- Copy only the files we need and not the entire source
- Use non root user
- ONly install prod dependencies
- Avoid leaking secrets
- Leverage multi stage builds where it makes sense 
