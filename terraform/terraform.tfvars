
# Cluster configuration
cluster_name = "souheil_k8s_cluster"
k8s_version  = "1.28.2"
k8s_cni      = "cilium"

# Node pool configuration
node_type   = "DEV1-M"
pool_size   = 1
min_size    = 0
max_size    = 1
autoscaling = true
autohealing = true
pool_name   = "souheil_pool"

# ingress configuration

ingress_release_name = "nginx-ingress"
ingress_namespace         = "kube-system"
ingress_repository_url    = "https://kubernetes.github.io/ingress-nginx"
ingress_chart_name        = "ingress-nginx"
ingress_service_type      = "LoadBalancer"

# cert-managerconfiguration
cert_manager_release_name     = "cert-manager"
cert_manager_namespace        = "cert-manager"
cert_manager_create_namespace = true
cert_manager_chart            = "cert-manager"
cert_manager_repository       = "https://charts.jetstack.io"
cert_manager_version          = "v1.14.5"
cert_manager_install_crds     = true
cert_manager_crds_enabled     = true


# Helm release configuration for Hello World app
hello_world_name      = "helloworld"
hello_world_namespace = "helloworld"
hello_world_chart     = "../hello-world"
