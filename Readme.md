# Free - Test de recrutement SRE / DevOps

This repository contains the Terraform scripts needed to set up a Kubernetes cluster on Scaleway, deploy an ingress controller, and run a simple "Hello World" application accessible via a Load Balancer IP.

## Overview

This project aims to:

1. Create a Kubernetes cluster in the `fr-par-1` region.
2. Deploy an nginx  ingress controller using Helm, custom service, or daemonset with a dedicated Scaleway Load Balancer.
3. Deploy a "Hello World" container using Helm.

The expected result is that accessing the Load Balancer IP should display the "Hello World" message.


## Useful links Documentation

- **Terraform Provider for Scaleway**: [Provider Documentation](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs)
- **Scaleway Load Balancers Ingress Annotations**: [GitHub Documentation](https://github.com/scaleway/scaleway-cloud-controller-manager/blob/master/docs/loadbalancer-annotations.md#servicebetakubernetesioscw-loadbalancer-id)

## Authentication 

to authenticate during our infrastructure provisionning we will use a configuration file. It is a YAML configuration file shared between the majority of the Scaleway developer tools. Its default location is $HOME/.config/scw/config.yaml. If it fails to detect credentials inline, or in the environment, Terraform will check this file. This method also supports a profile configuration that used in our authentification method: 

```yaml

profiles:
  myProfile:
    access_key: xxxxxxxxxxxxxxxxxxxx
    secret_key: xxxxxxxx-xxx-xxxx-xxxx-xxxxxxxxxxx
    default_organization_id: xxxxxxxx-xxx-xxxx-xxxx-xxxxxxxxxxx 
    default_project_id: xxxxxxxx-xxx-xxxx-xxxx-xxxxxxxxxxx
    default_zone: fr-par-2
    default_region: fr-par
    api_url: https://api.scaleway.com
    insecure: false
```

## Setup

1. **Clone the Repository**:

## Setup

1. **Clone the Repository**:

```
git clone [Repository URL]
cd [Repository Name]
```


2. **Initialize Terraform**:
``` 
terraform init 
```


4. **Apply Terraform Configuration**:

```
terraform apply
```