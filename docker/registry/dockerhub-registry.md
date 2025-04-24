## Registry
A registry is a repostory or a group of repository used to store and access container images

There are many different devices that offer clouds for putting our container images. 
From;
- Dockerhub
- github container registry(ghcr)
- Google container registry(gcr)
- Aws, Azure etc

If you are working in a team or just want to push your image to public, this is for you.
To push with dockerhub, these very simple steps should be followed;
- Firstly you need to be authenticated. You can ensure this by using `docker login`
- Secondlt you need to have a repo created in dockerhub, but if you push to with a repo name that doesn't exist, dockerhub auto
creates one under your username/acct

- Rename or have a reference of the local image you want to push to dockerhub pointing to the 'yourusername/repo:tag'. An optional
tag is allowed
To do this you run the command 
`docker tag my-local-image yourusername/repo-name:tag`
Another versionof the local image is created with the name `yourusername/repo-name:tag`

- then you can push this image to dockerhub using the command
`docker push yourusername/repo-name:tag`

Check your dockerhub acccount and you will see the image.
