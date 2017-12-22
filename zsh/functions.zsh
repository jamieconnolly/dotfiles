# Open the specified directory in your editor
function e() {
  $EDITOR "${1:-.}"
}

# Calculate the checksum of the specified version
function checksum() {
  version="${1:-$(git describe --tags --abbrev=0 --match='v[0-9]*' 2>/dev/null || true)}"
  if [ -z "$version" ]; then
    echo "!!! Error: version is not specified" >&2
    return 1
  fi

  url="$(hub browse -u -- "archive/${version}.tar.gz")"
  if ! curl --head --silent --fail --output /dev/null "$url"; then
    echo "!!! Error: archive ${url} doesn't exist" >&2
    return 1
  fi

  checksum="$(curl -fsSL "$url" | shasum -a 256 -b | awk '{print $1}')"
  if [ -z "$checksum" ]; then
    echo "!!! Error: failed to calculate checksum" >&2
    return 1
  fi

  echo "Checksum for ${version} is ${checksum}"
}
