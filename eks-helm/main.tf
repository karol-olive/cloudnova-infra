
resource "helm_release" "metrics_server" {
  name       = "metrics-server"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "metrics-server"
  namespace  = "kube-system"

  wait = false

  version = var.helm_metrics_server_version

  set {
    name  = "apiService.create"
    value = "true"
  }
}

resource "helm_release" "kube_state_metrics" {
  name       = "kube-state-metrics"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-state-metrics"
  namespace  = "kube-system"

  version = var.helm_kube_state_metrics_version

  set {
    name  = "apiService.create"
    value = "true"
  }

  set {
    name  = "metricLabelsAllowlist[0]"
    value = "nodes=[*]"
  }

  set {
    name  = "metricAnnotationsAllowList[0]"
    value = "nodes=[*]"
  }

}
