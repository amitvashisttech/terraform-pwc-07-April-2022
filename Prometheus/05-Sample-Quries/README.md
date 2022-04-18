```
prometheus_http_requests_total{job="prometheus",code="200"}

prometheus_http_requests_total{job="prometheus",code!~"2.."}

prometheus_http_requests_total{job="prometheus",code!~"3.."}
prometheus_http_requests_total{job="prometheus",code=~"3.*|4.*"}

1. Per Sec Http Request in Last 5 mins 

rate(prometheus_http_requests_total[5m])

2. WE can also sort the request by Label = Job 

sum(rate(prometheus_http_requests_total[5m])) by (job)

3. Total Utlization in bytes

(node_memory_MemTotal_bytes - node_memory_MemFree_bytes ) 

(node_memory_MemTotal_bytes - node_memory_MemFree_bytes ) /1024 /1024


4.Top Cpu Uitliztaion for an app running:

topk(3,sum(rate(node_cpu_seconds_total[15m]))) by (job)


DashBoard: 
==========> 

node_cpu_seconds_total{job="node",instance="localhost:9100"}

node_cpu_seconds_total{job="node",instance="localhost:9100",mode!="idle"}

irate(node_cpu_seconds_total{job="node",instance="localhost:9100",mode!="idle"}[5m])

irate(node_cpu_seconds_total{job="node",instance="localhost:9100",mode!="idle"}[15m])

```
