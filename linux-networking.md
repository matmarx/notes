# NETWORKING cmds
- network ifaces UP/DOWN
`sudo ifconfig eth0 up`
`sudo ip link set eth0 up`

- Assign IP Address to an Interface
`sudo ifconfig eth0 192.168.1.2`

- Assign a Netmask to an Interface
`sudo ifconfig eth0 netmask 255.255.255.0`

- Assign the Route to an Interface
`sudo route add default gw 192.168.1.1 eth0`

- Edit DNS Setting
`sudo vim /etc/resolv.conf`
| nameserver 8.8.8.8

- Or edit interfaces
`sudo vim /etc/network/interfaces`
```
auto eth0
iface eth0 inet static
  address 192.168.1.2
  netmask 255.255.255.0
  gateway 192.168.1.1
  dns-nameservers 8.8.8.8 8.8.4.4
```
`sudo systemctl restart networking`
`sudo /etc/init.d/networking restart`

## Locations
- rehl:
	/etc/sysconfig/network-scripts
- kali:
	managed=true in /etc/NetworkManager/NetworkManager.conf
	/etc/init.d/network-manager restart
