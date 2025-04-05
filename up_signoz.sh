helm repo add signoz https://charts.signoz.io
helm repo update
helm install signoz signoz/signoz \
   --replace \
   --namespace signoz --create-namespace \
   --wait \
   --timeout 1h \
   -f signoz.yaml