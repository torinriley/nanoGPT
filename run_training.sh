#!/bin/bash

# Check if WANDB_API_KEY is provided
if [ -z "$WANDB_API_KEY" ]; then
    echo "Error: WANDB_API_KEY environment variable is not set"
    echo "Please set it using: export WANDB_API_KEY=your_key_here"
    exit 1
fi

# Build the Docker image
docker build -t nanogpt-trainer .

# Run the container with GPU support and environment variables
docker run --gpus all \
    -e WANDB_API_KEY=$WANDB_API_KEY \
    -v $(pwd)/out:/app/out \
    nanogpt-trainer
