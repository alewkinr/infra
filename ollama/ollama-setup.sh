#!/bin/sh

DOCKER_IMAGE="ollama/ollama"
VOLUME_PATH="/mnt/disk1/ollama/"
KEEP_ALIVE="30m"

# Function to run the Docker container
run_ollama_container() {
    local volume_path="$1"
    local docker_image="$2"

    echo "🐳Running deepseek-coder-v2:16b in docker ..."
    docker run -d -v "${volume_path}:/root/.ollama" \
    -p 11434:11434 \
    -e OLLAMA_KEEP_ALIVE=${KEEP_ALIVE} \
    --name ollama "${docker_image}"
}

# Check if Docker is installed
if command -v docker >/dev/null 2>&1; then
    run_ollama_container "${VOLUME_PATH}" "${DOCKER_IMAGE}"
else
    echo "❌ Docker is not installed. Try later."
fi

