## Setting up Alert Manager
```
1:  git pull
2:  cd 04-Alert-Manager/
3:  ./install-alertmanager.sh
4:  cp -rf alertmanager-2.yml /etc/alertmanager/alertmanager.yml
5:  cp -rf alert.rules /etc/prometheus/
```
## Update the Prometheus config like below :  prometheus.yml
```
alerting:
  alertmanagers:
  - static_configs:
    - targets:
      - localhost:9093
```
## Copy the Rule File into prometheus :  prometheus.yml
```
rule_files:
  - "/etc/prometheus/alert.rules"
```

## Now please update your email address & genrate gmail App Token. 
```
1. Open the url: myaccount.google.com/security
2. Go to Security -> Signing in to Google -> App Password -> Genrate
3. Update the /etc/alertmanager/alertmanager.yml with email addresss by replacing amitvashist7@gmail.com & <<token>> with your app password.
```

## Restart AlertManger & Prometheus
```
systemctl restart alertmanager
systemctl restart prometheus
```
## Check the prometheus & AlertManager 
```
curl 172.31.0.100:9090
curl 172.31.0.100:9093
```

## Genrate some load for testing the alert
```
yes > /dev/null & 
```

## Kill all the yes process 
```
killall yes 
```



## Predefined Alert for ref:
```
https://awesome-prometheus-alerts.grep.to/rules.html#host-and-hardware
```

