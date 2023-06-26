# STEP ONE
## Clone the microservice repo into the server

[You need to generate a GitHub ssh key and add it to the server to be able to clone the repos](https://www.theserverside.com/blog/Coffee-Talk-Java-News-Stories-and-Opinions/GitHub-SSH-Key-Setup-Config-Ubuntu-Linux)


# STEP TWO
Note for a PHP project the repo would be cloned in the HTML directory, this is the full path: /var/www/html

All required dependencies for the language the service was written need to be installed.

For example a node js:
you would install node, docker-compose (and docker engine if required), and in the application directory run npm install to fetch and install all dependencies specified in the Package.json file.

# STEP THREE
## CREATE A DOCKERFILE
let's pick an account microservice for example

[Dockerfile](https://github.com/layor2257/Vertical-deployment/blob/main/Dockerfile)

## CREATE A RUN.SH

The [run.sh](https://github.com/layor2257/Vertical-deployment/blob/main/run.sh) file should be executable

# STEP FOUR
## Install Nginx and configure your domain, port, and SSL certificate

Using site enables and site available:

sites-available: The "sites-available" directory typically holds configuration files for various websites or virtual hosts that are available on the server. These configuration files define the settings, such as the domain, port, document root, SSL certificates, and other options for each website. However, these websites are not currently active or serving traffic until they are enabled.

sites-enabled: The "sites-enabled" directory contains symbolic links (or shortcuts) to the configuration files in the "sites-available" directory for the websites that should be active and serving traffic. By creating a symbolic link to a configuration file in "sites-available" within the "sites-enabled" directory, you effectively enable the website and make it accessible by the web server.

The separation between "sites-available" and "sites-enabled" allows for better organization and management of web server configurations. It enables administrators to easily enable or disable websites by manipulating the symbolic links in the "sites-enabled" directory without modifying the original configuration files in "sites-available". This approach helps prevent accidental misconfigurations and allows for easy management of multiple websites on a server.

```
## ACCOUNTTEST SERVICE
server {

        server_name accounttest.reckopay.com;

#       root /var/www/example.com;
#       index index.html;

        location / {
                # First attempt to serve request as file, then
                proxy_pass http://localhost:8010;
                proxy_set_header Host $host;
                proxy_set_header X-Real-IP $remote_addr;
                # as directory, then fall back to displaying a 404.
                # try_files $uri $uri/ =404;
        }




    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/accounttest.reckopay.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/accounttest.reckopay.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}
```
The SSL certificate part is been handled by certbot, [installation guide](https://www.inmotionhosting.com/support/website/ssl/lets-encrypt-ssl-ubuntu-with-certbot/)


Command to add certbot configuration to your endpoint:

```sudo certbot certonly --webroot -w /path/to/webroot -d accounttest.reckopay.com```

**Note: Always restart your nginx after every update**

# STEP FIVE
## Create a .env file to keep your environment variables

# STEP SIX
## Create an A sub-domain under the main domain. This can be done using e.g route 53



