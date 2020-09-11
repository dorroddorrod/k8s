#!/usr/bin/env bash
minikube start --cpus=6 --memory=10000
sleep 120
kubectl apply -f namespaces.yaml
kubectl apply -n kube-system -f $PWD/infra/network/ingress-controller/traefik
sleep 10
kubectl apply -n cd -f $PWD/infra/continuous-delivery/argo-cd
sleep 60
kubectl apply -f $PWD/infra/visibility/metrics-server/application.yaml
sleep 10
kubectl apply -f $PWD/infra/visibility/elk-operator/application.yaml
sleep 10
kubectl apply -f $PWD/infra/visibility/elk-cluster/application.yaml
sleep 120
#kubectl apply -n weave -f $PWD/infra/visibility/weave-scope
#sleep 10
kubectl apply -f $PWD/infra/visibility/fluent-bit/setup/application.yaml
sleep 10
kubectl apply -f $PWD/infra/visibility/fluent-bit/logging-stack/application.yaml
sleep 10
kubectl apply -f $PWD/infra/visibility/prometheus-operator/application.yaml
sleep 10
kubectl apply -f $PWD/infra/visibility/prometheus-cluster-monitoring/application.yaml
sleep 10
kubectl apply -f $PWD/infra/visibility/grafana/application.yaml
sleep 10
kubectl apply -f $PWD/infra/visibility/alertmanager/application.yaml
sleep 10
kubectl apply -f $PWD/infra/visibility/kube-state-metrics/application.yaml
sleep 10
kubectl apply -f $PWD/infra/visibility/node-exporter/application.yaml
sleep 120
kubectl apply -f $PWD/applications/example-app-metrics/application.yaml
sleep 10
kubectl apply -f $PWD/applications/example-app-logs/application.yaml
minikube addons enable metrics-server
