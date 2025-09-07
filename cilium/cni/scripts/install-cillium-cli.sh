#!/bin/bash
set -euo pipefail

# Detect architecture
CLI_ARCH="amd64"
[[ "$(uname -m)" == "arm64" ]] && CLI_ARCH="arm64"

# Specify a known working release version (change if newer release is available)
CILIUM_CLI_VERSION="v0.18.6"

# Construct download URLs
BASE_URL="https://github.com/cilium/cilium-cli/releases/download/${CILIUM_CLI_VERSION}"
TAR_FILE="cilium-darwin-${CLI_ARCH}.tar.gz"
SHA_FILE="${TAR_FILE}.sha256sum"

# Download tarball and checksum
echo "Downloading Cilium CLI ${CILIUM_CLI_VERSION} for ${CLI_ARCH}..."
curl -L --fail -O "${BASE_URL}/${TAR_FILE}"
curl -L --fail -O "${BASE_URL}/${SHA_FILE}"

# Verify checksum
echo "Verifying checksum..."
shasum -a 256 -c "${SHA_FILE}"

# Extract to /usr/local/bin
echo "Installing Cilium CLI to /usr/local/bin..."
sudo tar xzvf "${TAR_FILE}" -C /usr/local/bin

# Cleanup
rm -f "${TAR_FILE}" "${SHA_FILE}"

# Verify installation
echo "Cilium CLI installed successfully!"
cilium version