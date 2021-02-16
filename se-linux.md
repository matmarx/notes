# Permission control on RHEL linux, default enabled
> getenforce
* Enforcing / 1 - enabled and enforcing
* Permissive - enabledforce, for debugging
* Disabled / 0 - disabed

> setenforce 1/0

## config file
> /etc/selinux/config

## -Z flag gives you the SELinux context for a given file or process
> ps auxZ

> ls -laZ

## list modules
> seemodule -l

> getsebool module

## Configuring SE for httpd nginx
```
setsebool -P httpd_can_network_connect on
setsebool -P httpd_enable_homedirs on
chown -Rt httpd_sys_content_t /var/www/html
ls -lZ /var/www/html
-P persist, -R recursive, -t type
```

### For more content visit [hpe](https://www.hpe.com/us/en/insights/articles/how-to-set-up-selinux-right-the-first-time-1901.html)
