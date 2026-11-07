# opencode Docker

Minimal Docker image running [opencode](https://opencode.ai) on a Devuan
daedalus base.

## Build

    make bDevuan    # build base Devuan daedalus image (ddaedalus)
    make build      # build the opencode image
    make bAll       # both of the above

## Run

    make run        # interactive /bin/bash
    make oc         # launch opencode

Work happens in `/wrk` inside the container.

## Common commands

| Command       | Description                       |
| ------------- | --------------------------------- |
| `make build`  | Build the `opencode` image        |
| `make run`    | Run an interactive shell          |
| `make oc`     | Run opencode                      |
| `make s`      | Show containers and stats         |
| `make cleanD` | Remove the image                  |
| `make info`   | Show Docker disk usage and images |
