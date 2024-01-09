# Jenkins Credential Update Script

This Jenkins script automates the process of updating credentials in Jenkins. The script is designed to modify a Username/Password credential, and it includes dynamic information such as the current date and user.

## Prerequisites

- Jenkins Server
- Jenkins Job with the necessary permissions
- Jenkins Plugins:
  - Credentials Plugin
  - Pipeline Plugin
  - ...

## Usage

1. **Clone the Repository:**
   - Clone this repository to your local machine:

     ```bash
     git git@github.com:pathshaala/jenkins.git
     cd jenkins
     ```

2. **Configure Jenkins Credentials:**
   - Add a new Jenkins credential of type "Secret text" for the Jenkins API token.

3. **Update Script Variables:**
   - Open the Jenkins script (`update-credential.groovy`) and update the following variables:

     - `JENKINS_USER`: Your Jenkins API username.
     - `JENKINS_API_TOKEN`: Jenkins API token for authentication.
     - `JENKINS_URL`: The URL of your Jenkins server.
     - `CREDENTIAL_ID`: The ID of the credential you want to update.
     - `NEW_USERNAME`: The new username for the credential.
     - `NEW_PASSWORD`: The new password for the credential.
     - `UPDATE_API_ENDPOINT`: The Jenkins API endpoint for updating a credential.

4. **Run the Script:**
   - To update: ./api-calls/jenkins-cred.sh
   - To delete: ./api-calls/jenkins-cred.sh delete

