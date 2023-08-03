# Jenkins in 5 minutes.
Learning Jenkins by doing, step by step, how to ...

Here we will see who we can use Jenkins using jenkinsfile.

There are two types of jenkinfiles
1. Declarative Jenkinsfile: The Declarative Jenkinsfile provides a more structured and opinionated approach to defining your pipeline. It uses a predefined set of keywords to define the various stages and steps of your pipeline. Declarative Jenkinsfiles are generally recommended for simpler pipelines or for teams who prefer a more guided and standardized approach.

2. Scripted Jenkinsfile: The Scripted Jenkinsfile, also known as the "classic" or "scripted pipeline," offers a more flexible and script-based approach to defining your pipeline. It allows you to use Groovy script syntax to define the pipeline stages and steps. Scripted Jenkinsfiles are suitable for more complex pipelines or for teams who prefer greater flexibility and customization.

Will be focus on Scripted Jenkinsfile as it will give more flexiblity and customization to do things.

Prereq: 
1. Access to a functional Jenkins server with job creation permissions. Installation and setup of Jenkins will not be covered in the blog.
2. Access to a GitHub account and basic familiarity with Git. The blog will not cover Git basics but will focus on integrating Jenkins with GitHub for continuous integration workflows.
3. Using VSCode as your coding tool will be beneficial for the hands-on sections in the blog. Its versatility and extensions make it ideal for following along with the Jenkins-GitHub integration. Happy coding! 😊🚀
4. I'll keep each section under 5 minutes to maximize our time and make the learning process efficient.
Let's make the most of it! 🕐🚀

### Simple jenkinsfile
    - Pipeline with stages in sequence
    - Pipeline with parallor stage run
        - fail if any parallor stage fails and do not run next stage

### Using functions

### Multi branch 

### Multi arch (node)

### Credentials

### Env variable

### Using common functions accross jenkinsfile

### Using common function accross repos

### Triggers
    - cron
    - Upstream
    - Downstream
    - PR

### Notification


