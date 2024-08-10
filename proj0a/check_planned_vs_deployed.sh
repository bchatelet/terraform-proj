#!/bin/bash

# Check if the script is run in a valid Terraform directory
if [ ! -d ".terraform" ]; then
    echo "This script must be run in a directory with Terraform configuration."
    exit 1
fi

# Generate a list of planned resources
echo "Generating planned resources list..."
terraform plan -out=tfplan
terraform show -json tfplan | jq -r '.resource_changes[] | select(.change.actions[] == "create") | .address' > planned_resources.txt

# Generate a list of deployed resources
echo "Generating deployed resources list..."
terraform state list > deployed_resources.txt

# Compare the lists
echo "Comparing planned resources with deployed resources..."

# Resources that were planned but are not deployed
echo "Resources planned but not deployed:"
comm -23 <(sort planned_resources.txt) <(sort deployed_resources.txt)

# Cleanup
rm tfplan
rm planned_resources.txt
rm deployed_resources.txt