# Set your Jenkins credentials

#!/bin/bash
set -eu
SCRIPT_PATH="$(dirname -- "$(readlink -f "${BASH_SOURCE}")")"

# Default values
: "${JENKINS_USER:=jenkins-user}" # must have access to update and delete cread
: "${JENKINS_URL:=https://jenkins.server-url.com/}"

# Check if required variables are defined
: "${JENKINS_API_TOKEN?Please set JENKINS_API_TOKEN}"

#: "${CREDENTIAL_ID?Please set CREDENTIAL_ID}"
CREDENTIAL_ID="git-token" #updated it with credential wanted to update


# New username and password
NEW_USERNAME="new_username"
NEW_PASSWORD="new_password"

# Jenkins API endpoint for updating a credential
UPDATE_API_ENDPOINT="credentials/store/system/domain/_/credential/${CREDENTIAL_ID}/config.xml"

# Get the current date and username
CURRENT_DATE=$(date +"%Y-%m-%d")
UPDATED_BY=${JENKINS_USER}

# Combine date and user information for the description
DESCRIPTION="Updated on ${CURRENT_DATE} by ${UPDATED_BY}"

# New XML configuration for the updated credential
UPDATED_XML="<com.cloudbees.plugins.credentials.impl.UsernamePasswordCredentialsImpl>
  <scope>GLOBAL</scope>
  <id>${CREDENTIAL_ID}</id>
  <description>${DESCRIPTION}</description>
  <username>${NEW_USERNAME}</username>
  <password>${NEW_PASSWORD}</password>
</com.cloudbees.plugins.credentials.impl.UsernamePasswordCredentialsImpl>"

# Function to update the credential
updateCredential() {
    response=$(curl -s -w "%{http_code}" -X POST -u "${JENKINS_USER}:${JENKINS_API_TOKEN}" "${JENKINS_URL}/${UPDATE_API_ENDPOINT}" -H "Content-Type: application/xml" -d "${UPDATED_XML}")
    
    if [[ $response == *"200"* ]]; then
        echo "Credential updated successfully."
    else
        echo "Failed to update credential. HTTP response code: $response"
        exit 1
    fi
}

# Function to delete the credential
deleteCredential() {
    # Implement logic to delete the credential
    # Example: curl -s -w "%{http_code}" -X DELETE -u "${JENKINS_USER}:${JENKINS_API_TOKEN}" "${JENKINS_URL}/${UPDATE_API_ENDPOINT}"

    response=$(curl -s -w "%{http_code}" -X DELETE -u "${JENKINS_USER}:${JENKINS_API_TOKEN}" "${JENKINS_URL}/${UPDATE_API_ENDPOINT}")
    
    if [[ $response == *"204"* ]]; then
        echo "Credential deleted successfully."
    else
        echo "Failed to delete credential. HTTP response code: $response"
        exit 1
    fi
}

# Check command-line arguments
ACTION="${1:-update}"

case $ACTION in
    "update")
        updateCredential
        ;;
    "delete")
        deleteCredential
        ;;
    *)
        echo "Invalid action: $ACTION. Supported actions: update, delete."
        exit 1
        ;;
esac
