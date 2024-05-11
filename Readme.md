# Free - teSRE / DevOps

This repository contains the Terraform scripts needed to set up a Kubernetes cluster on Scaleway, deploy an ingress controller, and run a simple "Hello World" application accessible via a Load Balancer IP.

## Overview

This project aims to:

1. Create a Kubernetes cluster in the `fr-par-1` region.
2. Deploy an nginx  ingress controller using Helm, custom service, or daemonset with a dedicated Scaleway Load Balancer.
3. Deploy a "Hello World" container using Helm.

The expected result is that accessing the Load Balancer IP should display the "Hello World" message.

## Prerequisites

To test and deploy this application, you will need the following tools:
- [Flask](https://flask.palletsprojects.com/en/3.0.x/installation/)
- [Docker](https://docs.docker.com/engine/install/)

## Useful links Documentation

- **Terraform Provider for Scaleway**: [Provider Documentation](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs)
- **Scaleway Load Balancers Ingress Annotations**: [GitHub Documentation](https://github.com/scaleway/scaleway-cloud-controller-manager/blob/master/docs/loadbalancer-annotations.md#servicebetakubernetesioscw-loadbalancer-id)


## Local Testing

To start testing this application, you need to create a virtual environment, install the required dependencies in it, and then run the application.

```bash
python -m venv .venv

source ./.venv/bin/activate

# now you need to install the requirements in the virtual env
pip install -r requirements.txt
```

You can then start the app by running:

```bash
flask run --host 0.0.0.0 
```

## Build Process

The application will be built using Docker. We will create a Docker image based on our Dockerfile, which contains the necessary steps to build our image.

To build the image, use the following command:

```bash
docker build -t your-registry/image-name:tag .

# To push this image, you need to login to your registry using:

docker login

# Then, push your image using:

docker push your-registry/image-name:tag
```
Replace your-registry, image-name, and tag with your actual registry, image name, and tag respectively.

## Deployment

To deploy the application onto a Kubernetes cluster, we utilize Terraform for provisioning a Kubernetes cluster through the Scaleway cloud provider, along with other necessary resources. Following the setup of the cluster, the application is deployed using Helm.

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
## ressources 

In this Terraform setup, we are provisioning the following resources:

- **Scaleway VPC Private Network**
       
- **Scaleway Kubernetes Cluster**
      
- **Scaleway Kubernetes Node Pool**
        
- **Null Resource for Kubernetes Configuration**

- **Scaleway Load Balancer IP**

- **Helm Release for Nginx Ingress**
       
- **Helm Release for Cert-Manager**

- **Helm Release for Hello World Application**
 


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

3. **plan you infrastructure**:

``` 
terraform plan
```


4. **Apply Terraform Configuration**:

```
terraform apply
```

after the creation of all the ressources terraform will output the load balancer ip address to access the app on the cluster like this : 

![Alt text](image.png)

you can access the app with that ip [195.154.74.251](http://195.154.74.251)