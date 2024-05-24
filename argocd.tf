#https://artifacthub.io/packages/helm/argo/argo-cd/3.1.2

resource "kubernetes_namespace" "namespace_argocd" {
  metadata {
    name = var.argocd_k8s_namespace
  }
}
resource "null_resource" "apply_argocd_manifest" {
  provisioner "local-exec" {
    command = "kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/v2.5.8/manifests/install.yaml"
  }
}
resource "null_resource" "port_forward" {
  provisioner "local-exec" {
    command = "sleep 10 && kubectl patch svc argocd-server -n argocd -p '{\"spec\": {\"type\": \"NodePort\"}}'"
  }
  depends_on = [null_resource.apply_argocd_manifest]
}
