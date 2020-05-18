# caddy-deb-opt

This project builds a [Caddy](https://caddyserver.com/) deb package for Debian and Ubuntu.  The package installs Caddy to `/opt/caddy/`.  It sets up Caddy to look for configuration ([Caddyfiles](https://caddyserver.com/docs/caddyfile)) in `/etc/opt/caddy/Caddyfile.d/*.conf` and to store variable data like Let's Encrypt certificates in `/var/opt/caddy/`.

The package assumes you are going to configure Caddy though Caddyfiles, not the API.  This is why it does not start Caddy with `--resume`.

The installation paths are in accordance with the [Filesystem Hierarchy Standard](https://www.pathname.com/fhs/pub/fhs-2.3.html#OPTADDONAPPLICATIONSOFTWAREPACKAGES).  I like it because it prevents conflicts with offical packages and with software installed from source in `/usr/local/`.

## Building and deployment

You can build the package and install it on your server from a Debian/Ubuntu machine with SSH access to the server.  You will likely need a working knowledge of Debian or Ubuntu to succeed.  Follow the steps.

1\. Clone this repository on your developer/sysadmin machine.

2\. Download Caddy 2.x for the server's CPU architecture.  Copy the binary to `debian/opt/caddy/bin/caddy`.

3\. Run the following shell command.  Replace the values of `SSH_SERVER` and `SSH_PORT` with appropriate for the server you are deploying to.

```sh
sudo make deb && make deploy SSH_SERVER=example.com SSH_PORT=2020 && make clean
```

## License

MIT.
