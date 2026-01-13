#!/bin/bash

# Define the remote URL
REMOTE_URL="https://github.com/quartusik/team-work.git"

# 1. Initialize the repository
echo "Initializing repository..."
git init

# 2. Create the README and commit
echo "# team-work" >> README.md
git add README.md
git commit -m "first commit"

# 3. Rename branch to main and add remote
git branch -M main
# Check if remote already exists to avoid errors
if git remote | grep -q "origin"; then
    git remote set-url origin "$REMOTE_URL"
else
    git remote add origin "$REMOTE_URL"
fi

# 4. Push the initial commit
# Note: You will be prompted for credentials here unless already cached
echo "Pushing README..."
git push -u origin main

# 5. Create a test file, add content, and push
echo "Creating test file..."
touch test_file.txt
echo "This is a test file created at $(date)" > test_file.txt

git add test_file.txt
git commit -m "Added test file"

echo "Pushing test file..."
git push
