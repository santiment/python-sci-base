# Base docker image for python scientific app

This is a base image which includes some popular scientific libraries. Using this image will speed up the build processes of the CI builds.

## Usage

To use the base image, specify this in your `Dockerfile`:

```Dockerfile
FROM santiment/python-sci-base
```
