## Excute the script.

## Genrate the basic HTTP Auth Password with following command:
```
htpasswd -c /etc/nginx/.htpasswd admin

systectl restart nginx
```
## Check the Public IP
```
curl ifconfig.me
```

## Now try to access the Nginx on Https. https://YourMachine_PublicIP

