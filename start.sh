#!/usr/bin/env bash
root=$PWD
environment=prod
kubectl apply -f namespaces.yaml

function install {
  sleep 20
  cd $root/$1
  helm dependency update base/
  helm install $2  -f overlays/$environment/values.yaml -f base/values.yaml  --namespace $3 base/
}
install "infra/continuous-delivery/argo-cd" "argo-cd" "cd"
install "infra/continuous-delivery/argo-rollouts" "argo-rollouts" "cd"
install "infra/faas/openFaas" "openFaas" "faas"
#install "infra/networking/ingress-controller" "traefik" "traefik"
install "infra/networking/service-mesh/istio" "istio-operator" "istio-operator"

#kubectl apply -f service_monitor.yaml
