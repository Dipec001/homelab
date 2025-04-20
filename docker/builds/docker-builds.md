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
