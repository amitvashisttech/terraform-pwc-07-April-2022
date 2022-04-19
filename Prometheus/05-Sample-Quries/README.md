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

# Memory Utilization
```
1. Used
(node_memory_MemTotal_bytes{instance="10.0.2.4:9100",job="node"} - node_memory_MemFree_bytes{instance="10.0.2.4:9100",job="node"} - node_memory_Cached_bytes{instance="10.0.2.4:9100",job="node"} - node_memory_Buffers_bytes{instance="10.0.2.4:9100",job="node"} ) /1024 / 1024

2. Legend : Used  & Y-Axes to Unit : Bytes(MB)
3. Add Query B ->   Legend: Free  ( node_memory_MemFree_bytes{instance="172.31.0.101:9100",job="node"} )
4. Add Query C ->   Legend: Cached ( node_memory_Cached_bytes{instance="172.31.0.101:9100",job="node"} )
5. Add Query D ->   Legend: Buffer ( node_memory_Buffers_bytes{instance="172.31.0.101:9100",job="node"} )
```


# Add Varibale on Dashboard Level 
Edit the Dashboard -> Select Variables from left hand menu -> add new variable

1. NAME: DS_PROMETHEUS , TYPE: Data source, LABEL: datasource, Data Source Option TYPE: Prometheus -> Update.
2. NAME: job           , TYPE: Query,       LABEL: Job,        Query Option      Query: label_values(node_uname_info,job) -> Update.
3. NAME: node          , TYPE: Query,       LABEL: Host,       Query Option      Query: label_values(node_uname_info{job="$job"}, instance) , Sort: (asc) -> Update. 

4. NAME: diskdevices   , TYPE: Custom,      Hide: Variable,    Custom Option     Values separated by comma : [a-z]+|nvme[0-9]+n[0-9]+|mmcblk[0-9]+ -> Update.



## Memory Usage
```
100 - (   avg(node_memory_MemAvailable_bytes{job="$job", instance="$node"})  /   avg(node_memory_MemTotal_bytes{job="$job", instance="$node"}) * 100 )
```

## Disk Usage
```
node_filesystem_size_bytes{instance="$node",job="$job",device!~'rootfs'} - node_filesystem_avail_bytes{instance="$node",job="$job",device!~'rootfs'}
```



# Create Quick View & Its Panels

```
Dashboard Type ( Type State ) 
```
```
count(count(node_cpu_seconds_total{instance="$node",job="$job"}) by (cpu))

node_time_seconds{instance="$node",job="$job"} - node_boot_time_seconds{instance="$node",job="$job"}


node_memory_MemTotal_bytes{instance="$node",job="$job"}


node_filesystem_size_bytes{instance="$node",job="$job",mountpoint="/",fstype!="rootfs"}

```


```
Dashboard Type ( Type Guage ) 
```
```
((node_memory_MemTotal_bytes{instance="$node",job="$job"} - node_memory_MemFree_bytes{instance="$node",job="$job"}) / (node_memory_MemTotal_bytes{instance="$node",job="$job"} )) * 100


100 - ((node_filesystem_avail_bytes{instance="$node",job="$job",mountpoint="/",fstype!="rootfs"} * 100) / node_filesystem_size_bytes{instance="$node",job="$job",mountpoint="/",fstype!="rootfs"}

```
