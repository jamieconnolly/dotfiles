if command -v docker-machine >/dev/null 2>&1; then
  eval "$(docker-machine env default)"
fi
