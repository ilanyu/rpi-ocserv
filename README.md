# rpi-ocserv
ocserv on raspberrypi

## environment variables

BCPort -> UDP broadcast port

server_addr -> frp server_addr

server_port -> frp server_port

privilege_token -> frp privilege_token

## Use:

Start frps on windows:

open https://github.com/ilanyu/rpi-ocserv then download frps.exe and frps_full.ini

	frps.exe -c frps_full.ini

If you need other version, you can get from https://github.com/fatedier/frp/releases/tag/v0.16.0

Get the docker image:

	docker pull ilanyu/rpi-ocserv

Start an ocserv instance:

	docker run --restart=always --name ocserv --privileged -p 4443:4443 -p 4443:4443/udp -e "BCPort=3801" -e "server_addr=192.168.123.11" -e "privilege_token=12345678" -d ilanyu/rpi-ocserv

Add user:

	docker exec -ti ocserv ocpasswd -c /etc/ocserv/ocpasswd

Delete user:

	docker exec -ti ocserv ocpasswd -c /etc/ocserv/ocpasswd -d test

