<!-- This is a comment -->
# Rails App Documentation


## Overview
This module created for achieving Rails Hello App with Postgre and Redis.Prometheus Alerts and Grafana Dashboard for Monitoring. 
## Preview
All enviroments and tools chosed by me. You can change them according to your needs.

## Steps
- 1: Create EC2 Instance and all requirement in provisioning list.
- 2: Create Alert and Dashboards.
- 3: Create Rails App and components
- 4: Create Github Actions for CI/CD
- 5: Create Github Actions for Terraform Apply


## Build List
- 1: Clone the repository
- 2: Add Secrets for authorized user of AWS Account into your Github Actions
- 3: Create S3 bucket for state
- 4: Run TF Apply Pipeline

## List Of Required Alerts and Metrics

### 1: Rails Application (Hello World App)
  ```
  Response Time (Latency): Measure how quickly the application responds to requests. A low response time ensures a smooth user experience.
  Request Rate (Throughput): Monitor the number of requests per second to determine the system's load.
  Error Rate: Track 4xx/5xx responses to monitor application errors.
  Memory Usage: Monitor memory consumption to avoid out-of-memory crashes.
  CPU Usage: Track CPU utilization to detect potential performance bottlenecks.
  ```
### 2: PostgreSQL
  ```
  Database Connections: Monitor the number of active connections to ensure the database isn't overloaded.
  Query Latency: Track query performance to detect slow queries that could degrade app performance.
  Cache Hit Ratio: Higher cache hit ratios improve performance, as fewer queries hit the disk.
  Disk I/O: Monitor read/write operations to ensure disk activity isn’t a bottleneck.
  Database Size: Track database growth over time to plan for scaling.
  ```
### 3: Redis
  ```
  Memory Usage: Redis stores data in memory, so keeping track of how much memory is used is critical.
  Evicted Keys: Monitor the number of keys evicted due to memory constraints, which indicates that Redis may be running out of memory.
  Cache Hit/Miss Ratio: A low hit rate might indicate issues with caching strategies or inefficient usage.
  Command Latency: Keep an eye on how long commands take to execute; increased latency may indicate system overload.
  ```
### 4: System Metrics (Node Exporter)
  ```
  CPU Utilization: Tracks the overall CPU usage of the server.
  Memory Usage: Ensure enough free memory is available for system processes and services.
  Disk Usage: Track disk utilization, especially for databases like PostgreSQL.
  Network Traffic: Monitor inbound and outbound network traffic to detect abnormal spikes or outages.
  ```
### 5: Golden Signals
  ```
  Latency: Measures the time taken to process requests. An alert is triggered if the latency exceeds a threshold (e.g., 1 second).
  Traffic: Measures the rate of incoming requests. It helps gauge load.
  Errors: Counts the rate of non-2xx HTTP responses to monitor error rates.
  Saturation: Monitors resource utilization (CPU, memory) to ensure the system is not overloaded.
  Apdex Score: Measures user satisfaction based on request latency. It is a composite score that provides an overall view of user experience. An alert is triggered if the Apdex score falls below a threshold (e.g., 0.8).
  ```


#### Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
---
#### Requirements

No requirements.
---
#### Modules

No modules.

---
## Arguments required by Module

#### Inputs

No inputs.
---
---
## Resources and Output attributes by Module
---
#### Resources

| Name | Type |
|------|------|
| [aws_instance.rails_app](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_key_pair.deployer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_security_group.rails_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
---
#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_ec2_instance_public_ip"></a> [ec2\_instance\_public\_ip](#output\_ec2\_instance\_public\_ip) | n/a |

## Versions
- v1
  - EC2 Infra Provisioning
- v1.1
  - Deploy APP
- v1.2
  - Deploy Monitoring
<!-- This is a comment -->