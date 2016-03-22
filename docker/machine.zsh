# Load the local docker client
if which docker-machine &>/dev/null; then
  if [ -n "$(docker-machine status local 2>/dev/null)" ]; then
    eval "$(docker-machine env local)"
  fi
fi
