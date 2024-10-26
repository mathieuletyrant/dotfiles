#!/bin/bash

# Ask for the signing key
echo "Please enter your signing key:"
read SIGNING_KEY

if [ -z "$SIGNING_KEY" ]; then
    echo "Error: Signing key cannot be empty"
    exit 1
fi

# Check if file already exists
if [ -f ~/.gitconfig.local ]; then
    echo "Warning: ~/.gitconfig.local already exists"
    read -p "Do you want to replace it? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Operation cancelled"
        exit 1
    fi
fi

# Create .gitconfig.local file
cat << EOF > ~/.gitconfig.local
[user]
	signingkey = $SIGNING_KEY

[gpg]
	format = ssh

[gpg "ssh"]
	program = /Applications/1Password.app/Contents/MacOS/op-ssh-sign

[commit]
	gpgsign = true
EOF

# Check if creation was successful
if [ $? -eq 0 ]; then
    echo "File ~/.gitconfig.local has been created successfully"
    echo "File content:"
    cat ~/.gitconfig.local
else
    echo "Error creating file"
    exit 1
fi

# Set permissions
chmod 600 ~/.gitconfig.local

echo "Permissions have been set to 600 (read/write for owner only)"