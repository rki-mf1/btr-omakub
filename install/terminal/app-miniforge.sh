DOWNLOAD_URL="https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
DOWNLOAD_DIR="$(mktemp -d)"
# Clean up installer when the script finishes
trap 'rm -rf -- "$DOWNLOAD_DIR"' EXIT
wget -O "$DOWNLOAD_DIR/miniforge.sh" "$DOWNLOAD_URL"
bash "$DOWNLOAD_DIR/miniforge.sh" -b -f
