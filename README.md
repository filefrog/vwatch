filefrog/vwatch Docker Image
============================

This is a Docker image that knows how to check upstream (Internet)
sources for new versions of things and trigger some other action
(via an exec) in case it finds a new thing.

This is part of an experimental CI/CD and rel/eng toolchain.

To run it:

    docker run --rm -it \
      -v $PWD/scripts:/trigger \
      filefrog/vwatch git 2.20.0 -- /trigger/release git

In this example, if version 2.24.6 is found on the canonical
upstream git downloads page, the `/trigger/release` script will be
invoked with the following arguments:

  1. `git` (because that's what's in the invocation)
  2. `2.24.6` (the version found)
  3. `https://.../git-2.24.6.tgz` (URL to download 2.24.6)

This container is meant to be used from an external scheduler like
regular old cron or as a Kubernetes CronJob resource.
