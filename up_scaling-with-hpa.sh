# https://www.spinkube.dev/docs/topics/autoscaling/scaling-with-hpa/

k3d cluster create wasm-cluster-scale \
  --image ghcr.io/spinkube/containerd-shim-spin/k3d:v0.18.0 \
  -p "8081:80@loadbalancer" \
  --agents 2


# Install cert-manager CRDs
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.14.3/cert-manager.crds.yaml

# Add and update Jetstack repository
helm repo add jetstack https://charts.jetstack.io
helm repo update

# Install the cert-manager Helm chart
helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --version v1.14.3


# Install the RuntimeClass
kubectl apply -f https://github.com/spinframework/spin-operator/releases/download/v0.5.0/spin-operator.runtime-class.yaml

# Install the CRDs
kubectl apply -f https://github.com/spinframework/spin-operator/releases/download/v0.5.0/spin-operator.crds.yaml


# Install Spin Operator
helm install spin-operator \
  --namespace spin-operator \
  --create-namespace \
  --version 0.5.0 \
  --wait \
  oci://ghcr.io/spinframework/charts/spin-operator

# Install the shim executor
kubectl apply -f https://github.com/spinframework/spin-operator/releases/download/v0.5.0/spin-operator.shim-executor.yaml


# Setup ingress following this tutorial https://k3d.io/v5.4.6/usage/exposing_services/
cat <<EOF | kubectl apply -f -
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: nginx
  annotations:
    ingress.kubernetes.io/ssl-redirect: "false"
spec:
  rules:
  - http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: hpa-spinapp
            port:
              number: 80
EOF


# Install SpinApp and HPA
kubectl apply -f https://raw.githubusercontent.com/spinframework/spin-operator/main/config/samples/hpa.yaml
