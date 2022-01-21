# dns-server

All you need, to get the `bind9` Name-Server from (https://www.isc.org/bind/) running in a temporary environment.

WIth `setup.sh` a new Network Namespace (https://en.wikipedia.org/wiki/Linux_namespaces) will be created on your system for each nameserver you start. Running multiple name servers on one machine becomes very easy.

I use this to configure and test other services which are sort of dependent on the DNS Infrastruktur.

## Requirements
You have to install `bind9`.

On Debian:

	$ sudo apt install bind9
	$ sudo systemctl --now disable named

## Getting Started

	$ make
	$ sudo ./setup.sh
	$ sudo ./run.sh

### Check if DNS-Server is working

	$ dig @172.17.53.1 outside.tld


# Disclaimer

Don't use this in a productive environment. Especially don't use that on the interne.
Should be only used in an environment you have control.

