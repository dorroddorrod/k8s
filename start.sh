#!/usr/bin/env bash
path=/Users/dormull/Documents/Repositories/k8s
minikube start --cpus=6 --memory=10000
sleep 120
minikube addons enable metrics-server
kubectl apply -f namespaces.yaml
kubectl apply -n kube-system -f $path/metrics-server
sleep 60
kubectl apply -n kube-system -f $path/traefik
sleep 10
kubectl apply -n monitoring -f $path/monitoring/elk-operator
sleep 10
kubectl apply -n monitoring -f $path/monitoring/elk-cluster
sleep 120
#kubectl apply -n weave -f $path/weave-scope
#sleep 10
kubectl apply -n monitoring -f $path/monitoring/fluent-bit/setup
sleep 10
kubectl apply -n monitoring -f $path/monitoring/fluent-bit/logging-stack
sleep 10
kubectl apply -n monitoring -f $path/monitoring/prometheus-operator
sleep 10
kubectl apply -n monitoring -f $path/monitoring/prometheus-cluster-monitoring
sleep 10
kubectl apply -n monitoring -f $path/monitoring/grafana
sleep 10
kubectl apply -n monitoring -f $path/monitoring/alertmanager
sleep 10
kubectl apply -n monitoring -f $path/monitoring/kube-state-metrics
sleep 10
kubectl apply -n monitoring -f $path/monitoring/node-exporter
sleep 120
kubectl apply -n example -f $path/example-app-metrics
sleep 10
kubectl apply -n example -f $path/example-app-logs
minikube addons enable metrics-server
