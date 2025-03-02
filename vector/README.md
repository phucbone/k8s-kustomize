# Vector Bundle

## DEV Architecture

```plaintext
+----------------+       +-----------------------+      +---------------+
| Vector Agent  | ---> | Vector Aggregator | ---> | OpenSearch |
+----------------+       +-----------------------+      +---------------+
```

|Thành phần|Type|Replicas|CPU Requests|CPU Limits|Memory Requests|Memory Limits|
|---|---|---|---|---|---|---|
|Vector Agent|Daemonset|1|200m|750m|256Mi|512Mi|
|Vector Aggregator|Deployment|2|500m|1.5|512Mi|1.5Gi|
|OpenSearch|Statefulset|2|1.5|4|3Gi|6Gi|
|SUM|||

## PROD Architecture

```plaintext
+----------------+       +--------+       +------------+      +-----------------------+      +---------------+
| Vector Agent  | ---> | Kafka | ---> | HAProxy | ---> | Vector Aggregator | ---> | OpenSearch |
+----------------+       +--------+       +------------+      +-----------------------+      +---------------+
```

|Thành phần|Type|Replicas|CPU Requests|CPU Limits|Memory Requests|Memory Limits|
|---|---|---|---|---|---|---|
|Vector Agent|Daemonset|1|200m|750m|256Mi|512Mi|
|Kafka|Statefulset|3|750m|2|1.5Gi|3Gi|
|HAProxy|Deployment|2|750m|2|1.5Gi|3Gi|
|Vector Aggregator|Statefulset|3|500m|1.5|512Mi|1.5Gi|
|OpenSearch|Statefulset|3|1.5|4|3Gi|6Gi|
|SUM|||


