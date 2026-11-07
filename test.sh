#!/bin/bash

# Define the string to search for
SEARCH_STRING="zoxide"

# Check if the string is in the ~/.zshrc file
if grep -q "$SEARCH_STRING" ~/.zshrc; then
  echo "Symbol found in ~/.zshrc"
else
  echo "String not found in ~/.zshrc"
  exit 1
fi