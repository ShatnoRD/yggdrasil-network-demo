# Yggdrasil Network experiments

This repository contains a minimal proof of concept demonstrating peer-to-peer networking capability using Yggdrasil. The implementation establishes a direct connection between two independent nodes in a simplified environment.

[Yggdrasil Network](https://yggdrasil-network.github.io/) is an early-stage implementation of a fully end-to-end encrypted IPv6 network that uses a global spanning tree for routing and a distributed hash table for addressing.

The current setup was heavily inspired by [this gist](https://gist.github.com/Ravenstine/707180ef29e9d37a8f816e019ca32dbf) and it deliberately focuses on demonstrating fundamental connectivity rather than advanced features.

## Getting Started

Spin up the docker containers using docker-compose:

```bash
docker-compose up -d
```

## Overview

This proof of concept demonstrates:
- Direct peer-to-peer connectivity between two Yggdrasil nodes
- Cross-node service access using IPv6 networking
- Port forwarding to access services across nodes

## Network Structure
```
 ┌──────────────────┐       ┌───────────────────┐       ┌───────────────────┐       ┌─────────────────┐
 │   nginx-nidhogg  │────── │ yggdrasil-node-a  │=======│ yggdrasil-node-b  │───────│  nginx-ratatosk │
 │  (Web Server A)  │node-a │ (Mesh Node A)     │peering│ (Mesh Node B)     │node-b │ (Web Server B)  │ 
 └──────────────────┘       └───────────────────┘       └───────────────────┘       └─────────────────┘
```

## Components Explanation

- **nginx-nidhogg**: Web server running alongside Node A
- **yggdrasil-node-a**: First network node that establishes peer connection
- **yggdrasil-node-b**: Second network node that peers with node-a
- **nginx-ratatosk**: Web server running alongside Node B

## Accessing Services
- **Accessing Nginx-Ratatosk through yggdrasil-node-a**: http://localhost:8081
- **Accessing Nginx-Nidhogg through yggdrasil-node-b**: http://localhost:8082

## Configuration
The node configuration files [yggdrasil-node-a.conf](./config/yggdrasil/yggdrasil-node-a.conf) and [yggdrasil-node-b.conf](./config/yggdrasil/yggdrasil-node-b.conf) should be customized according to the [Yggdrasil Configuration Reference](https://yggdrasil-network.github.io/configurationref.html). 

**⚠️ Security Warning**: Both configuration files contain private keys that are included for demonstration purposes only. In a real-world scenario, never commit private keys to a repository. Generate new keys for each deployment and store them securely.

## For more information about Yggdrasil Network
- [Official Documentation](https://yggdrasil-network.github.io/documentation.html)
- [GitHub Repository](https://github.com/yggdrasil-network/yggdrasil-go)