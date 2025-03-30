helm repo add open-telemetry https://open-telemetry.github.io/opentelemetry-helm-charts

helm install otel-collector open-telemetry/opentelemetry-collector --values ./opentelemetry-collector.yaml

helm install otel-collector-cluster open-telemetry/opentelemetry-collector --values ./k8s-receivers.yaml
