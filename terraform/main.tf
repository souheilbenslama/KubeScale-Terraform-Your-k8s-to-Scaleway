
# provisionning the cluster 

resource "scaleway_vpc_private_network" "souheil_vpc" {
    name= "souheil_private_network"
    provider = scaleway.p2
}


resource "scaleway_k8s_cluster" "souheil_k8s" {
  name    = var.cluster_name
  provider = scaleway.p2
  version = var.k8s_version
  cni     = var.k8s_cni
  private_network_id = scaleway_vpc_private_network.souheil_vpc.id
  delete_additional_resources = false
}


resource "scaleway_k8s_pool" "souheil_pool" {
  cluster_id = scaleway_k8s_cluster.souheil_k8s.id
  name       = var.pool_name
  provider = scaleway.p2
  node_type  = var.node_type
  size       = var.pool_size
  min_size = var.min_size
  max_size = var.max_size
  autoscaling = var.autoscaling
  autohealing = var.autohealing
}

# configue the kubernetes provider 

resource "null_resource" "kubeconfig" {
  depends_on = [scaleway_k8s_pool.souheil_pool] # at least one pool here
  triggers = {
    host                   = scaleway_k8s_cluster.souheil_k8s.kubeconfig[0].host
    token                  = scaleway_k8s_cluster.souheil_k8s.kubeconfig[0].token
    cluster_ca_certificate = scaleway_k8s_cluster.souheil_k8s.kubeconfig[0].cluster_ca_certificate
  }
}


# create the helm provider 

provider "helm" {
  kubernetes {
    host = null_resource.kubeconfig.triggers.host
    token = null_resource.kubeconfig.triggers.token
    cluster_ca_certificate = base64decode(
    null_resource.kubeconfig.triggers.cluster_ca_certificate
    )
  }
}


resource "scaleway_lb_ip" "nginx_ip" {
  provider = scaleway.p2
}

resource "helm_release" "nginx_ingress" {
  name      = var.ingress_release_name
  namespace = var.ingress_namespace

  repository = var.ingress_repository_url
  chart = var.ingress_chart_name

  set {
    name = "controller.service.loadBalancerIP"
    value = scaleway_lb_ip.nginx_ip.ip_address
  }

   set {
    name = "controller.service.type"
    value = var.ingress_service_type
  }

}


resource "helm_release" "cert-manager" {
  name             = var.cert_manager_release_name
  namespace        = var.cert_manager_namespace
  create_namespace = var.cert_manager_create_namespace
  chart            = var.cert_manager_chart
  repository       = var.cert_manager_repository
  version          = var.cert_manager_version

   set {
    name  = "installCRDs"
    value = var.cert_manager_install_crds
  }

   set {
    name  = "crds.enabled"
    value = var.cert_manager_crds_enabled
  }
}


resource "helm_release" "hello_world_app" {
  name      = "helloworld"
  namespace = "default"
  chart      = "../hello-world"
}

