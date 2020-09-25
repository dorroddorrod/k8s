## Components
This setup includes:

* Traefik ingress controller
* OpenFaas
* Istio
* Kiali
* Prometheus operator 
* Prometheus cluster
* Alert manager
* Node-exporter
* Metrics-server
* ArgoCd
* Grafana
* ELK-operator
* ElasticSearch
* Kibana
* Example application for logs
* Example application for metrics
* Example application for tracing
* Example application for service mesh
* Fluent-bit operator
* Fluent-bit deamonset
* Weave-scope
* Jaeger operator
* Jaeger cluster
## Getting started

First, we will need to set few DNS records in ```/etc/hosts``` file to be able access the cluster components
```aidl
127.0.0.1 app.kubernetes.local
127.0.0.1 app-tracing.kubernetes.local
127.0.0.1 grafana.kubernetes.local
127.0.0.1 prometheus.kubernetes.local
127.0.0.1 traefik.kubernetes.local
127.0.0.1 weave-scope.kubernetes.local
127.0.0.1 elasticsearch.kubernetes.local
127.0.0.1 kibana.kubernetes.local
127.0.0.1 argo.kubernetes.local
127.0.0.1 jaeger.kubernetes.local
127.0.0.1 openfaas.kubernetes.local
127.0.0.1 bookinfo-app.kubernetes.local
127.0.0.1 kiali.kubernetes.local
```

After setting up the DNS records, you can run the cluster by running :
```
./start
```
Then, we will need to assign a local IP adrress to the ingress controller to be able interact with the cluster components.

This can be done by running :
```
minikube tunnel 
```

To observe the cluster state, open another terminal and run :
```
minikube dashboard
```

To get the ArgoCd web-ui password (for admin user) , run :
```
kubectl get pods -n cd -l app.kubernetes.io/name=argocd-server -o name | cut -d'/' -f 2
```
OpenFaas UI credentials:
```
User: admin
Pass: 8627b5a542b1f5134246c23b22b6f2dfd10c8898
```
