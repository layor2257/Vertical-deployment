# STEP ONE
## Clone the microservice repo into the server

[You need to generate a GitHub ssh key and add it to the server to be able to clone the repos](https://www.theserverside.com/blog/Coffee-Talk-Java-News-Stories-and-Opinions/GitHub-SSH-Key-Setup-Config-Ubuntu-Linux)


# STEP TWO
Note for a PHP project the repo would be cloned in the HTML directory, this is the full path: /var/www/html

All required dependencies for the language the service was written need to be installed.

For example a node js:
you would install node, docker-compose (and docker engine if required), and in the application directory run npm install to fetch and install all dependencies specified in the Package.json file.

# CREATE A DOCKERFILE
let's pick an account microservice for example

[Dockerfile](https://learn.microsoft.com/en-us/azure/aks/kubernetes-action)


