output "kube_config" {
  value = scaleway_k8s_cluster.souheil_k8s.kubeconfig[0].config_file
  sensitive = true
}

output "loadbalanceIP" {
  value = scaleway_lb_ip.nginx_ip.ip_address
}