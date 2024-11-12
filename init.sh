#!/bin/bash

# Start ollama serve in the background
ollama serve &

# Optionally, redirect output to /dev/null to avoid cluttering the terminal
# ollama serve > /dev/null 2>&1 &

# Wait a moment to ensure ollama has started
sleep 5

# Start ngrok on a specific port 
ngrok http --log stderr 11434 --host-header 'localhost:11434'