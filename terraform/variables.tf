
# cluster variables definition
variable "cluster_name" {
  description = "the name of your kubernetes cluster ressource "
  type = string
  default = "k8s_cluster"
}


variable "k8s_version" {
  description = "the version of kubernetes in your kubernetes cluster ressource "
  type = string
  default = "1.28.2"
}

variable "k8s_cni" {
  description = "the cni that is used in your k8s cluster "
  type = string
  default = "cilium"
}


variable "node_type" {
  description = "The type of node to use in the Kubernetes pool."
  type        = string
  default     = "DEV1-M"  // Set default as DEV1-M or remove default to require explicit input
}

variable "pool_size" {
  description = "The number of nodes in the pool."
  type        = number
  default     = 1
}

variable "min_size" {
  description = "The minimum size of the node pool."
  type        = number
  default     = 0
}

variable "max_size" {
  description = "The maximum size of the node pool."
  type        = number
  default     = 1
}

variable "autoscaling" {
  description = "Determines if the node pool should use autoscaling."
  type        = bool
  default     = true
}

variable "autohealing" {
  description = "Determines if the node pool should use autohealing."
  type        = bool
  default     = true
}

variable "pool_name" {
  description = "The name of the node pool."
  type        = string
  default     = "k8S_pool"
}

# ingress variables

variable "ingress_release_name" {
  description = "The name of the Helm release."
  type        = string
  default     = "nginx-ingress"
}

variable "ingress_namespace" {
  description = "The Kubernetes namespace in which the Helm chart will be deployed."
  type        = string
  default     = "kube-system"
}

variable "ingress_repository_url" {
  description = "The repository URL where the Helm chart is located."
  type        = string
  default     = "https://kubernetes.github.io/ingress-nginx"
}

variable "ingress_chart_name" {
  description = "The name of the chart to deploy."
  type        = string
  default     = "ingress-nginx"
}


variable "ingress_service_type" {
  description = "The type of service to create."
  type        = string
  default     = "LoadBalancer"
}

# cert-manager variables

variable "cert_manager_release_name" {
  description = "The name of the Helm release for cert-manager."
  type        = string
  default     = "cert-manager"
}

variable "cert_manager_namespace" {
  description = "The Kubernetes namespace in which cert-manager will be deployed."
  type        = string
  default     = "cert-manager"
}

variable "cert_manager_create_namespace" {
  description = "Specifies if the namespace should be created."
  type        = bool
  default     = true
}

variable "cert_manager_chart" {
  description = "The name of the chart to deploy cert-manager."
  type        = string
  default     = "cert-manager"
}

variable "cert_manager_repository" {
  description = "The repository URL where the cert-manager chart is located."
  type        = string
  default     = "https://charts.jetstack.io"
}

variable "cert_manager_version" {
  description = "The version of the cert-manager chart to deploy."
  type        = string
  default     = "v1.14.5"
}

variable "cert_manager_install_crds" {
  description = "Specifies whether to install CRDs."
  type        = bool
  default     = true
}

variable "cert_manager_crds_enabled" {
  description = "Specifies whether CRDs are enabled."
  type        = bool
  default     = true
}


# the app variabls 

variable "hello_world_name" {
  description = "The name of the Helm release for the Hello World application."
  type        = string
  default     = "helloworld"
}

variable "hello_world_namespace" {
  description = "The Kubernetes namespace in which the Hello World app will be deployed."
  type        = string
  default     = "default"
}

variable "hello_world_chart" {
  description = "The path to the Hello World chart."
  type        = string
  default     = "../hello-world"
}
