#!/bin/bash

# Check if both model and content are provided as arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <tiny/small/medium> <blablabla>"
    exit 1
fi

MODEL="$1"
CONTENT="$2"
ACCESS_TOKEN="Paste your API key here"

# Make API call and store the output in a variable
OUTPUT=$(curl -s --location "https://api.mistral.ai/v1/chat/completions" \
     --header 'Content-Type: application/json' \
     --header 'Accept: application/json' \
     --header "Authorization: Bearer $ACCESS_TOKEN" \
     --data '{
        "model": "'"mistral-$MODEL"'",
        "messages": [
            {
                "role": "user",
                "content": "'"$CONTENT"'"
            }
        ]
    }' | jq -r '.choices[0].message.content')

# Print a formatted message with the output
echo -e "\n=== Mistral Response ===\n"
echo "$OUTPUT"
echo -e "\n=======================\n"
