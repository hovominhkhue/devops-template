# System Architecture

```mermaid
graph TD
    User -->|HTTP Requests| LoadBalancer
    LoadBalancer --> NodeService
    LoadBalancer --> PythonService
    NodeService -->|Database Queries| Database
    PythonService -->|API Calls| ExternalAPI
    NodeService --> Monitoring
    PythonService --> Monitoring
    Monitoring -->|Metrics| Prometheus
    Prometheus --> Grafana