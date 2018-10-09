# Docker development environment for C++

Compilers:
  - Clang 6
  - GCC 8

Tools:
  - Valgrind
  - GDB
  - CppCheck
  - CMake/CMake-gui

Code Editor:
  - VS Code

Other:
  - Custom `clang-tidy-diff.py`
  - Git `pre-commit` script

# Sample usage

Build image:
```
docker build -t "janosimas:dev" --build-arg USER_ID=`id -u $USER` --build-arg GROUP_ID=`id -g $USER` --build-arg USER_NAME=`id -un $USER` --build-arg GROUP_NAME=`id -gn $USER`.
```

Run image sharing `DISPLAY`, `NETWORK` and `~/devel` folder:
```
docker run --restart unless-stopped -itd --network host --name docker_dev -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=${DISPLAY} -v ~/devel:~/devel janosimas:dev
```

Run a visual tool
```
xhost + && docker exec -it docker_dev code
```

# References
Some inspiration and create docker user: https://github.com/BrainTwister/docker-devel-env

# TODO
  - Sample compose script
  - Custom `git` script that copy `pre-commit` on clone