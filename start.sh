#!/usr/bin/env bash
minikube start --cpus=6 --memory=11000
sleep 40
kubectl apply -f namespaces.yaml
sleep 40
kubectl apply -n traefik -f $PWD/infra/networking/ingress-controller/traefik
sleep 40
kubectl apply -n cd -f $PWD/infra/continuous-delivery/argo-cd
sleep 40
kubectl apply -f $PWD/infra/faas/openFaas/application.yaml
sleep 40
kubectl apply -f $PWD/infra/visibility/prometheus-operator/application.yaml
sleep 40
kubectl apply -f $PWD/infra/visibility/metrics-server/application.yaml
sleep 40
kubectl apply -f $PWD/infra/visibility/elk-operator/application.yaml
sleep 40
kubectl apply -f $PWD/infra/visibility/elk-cluster/application.yaml
sleep 40
kubectl apply -f $PWD/infra/networking/service-mesh/istio/application.yaml
sleep 40
kubectl apply -n weave -f $PWD/infra/visibility/weave-scope
sleep 40
kubectl apply -f $PWD/infra/visibility/fluent-bit/setup/application.yaml
sleep 40
kubectl apply -f $PWD/infra/visibility/fluent-bit/logging-stack/application.yaml
sleep 40
kubectl apply -f $PWD/infra/visibility/prometheus-cluster-monitoring/application.yaml
sleep 40
kubectl apply -f $PWD/infra/visibility/grafana-operator/application.yaml
sleep 40
kubectl apply -f $PWD/infra/visibility/grafana-cluster/application.yaml
sleep 40
kubectl apply -f $PWD/infra/visibility/alertmanager/application.yaml
sleep 40
kubectl apply -f $PWD/infra/visibility/kube-state-metrics/application.yaml
sleep 40
kubectl apply -f $PWD/infra/visibility/node-exporter/application.yaml
sleep 40
kubectl apply -f $PWD/infra/visibility/jaeger-operator/application.yaml
sleep 40
kubectl apply -f $PWD/infra/visibility/jaeger-cluster/application.yaml
sleep 40
kubectl apply -f $PWD/applications/example-app-metrics/application.yaml
sleep 40
kubectl apply -f $PWD/applications/example-app-logs/application.yaml
sleep 40
kubectl apply -f $PWD/applications/example-app-tracing/application.yaml
sleep 40
kubectl apply -f $PWD/applications/example-app-istio/application.yaml
kubectl apply -f service_monitor.yaml
minikube addons enable metrics-server
