output "loadbalanceIP" {
  value = scaleway_lb_ip.nginx_ip.ip_address
}