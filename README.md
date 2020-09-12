## Components
This setup includes:

* Traefik ingress controller
* Prometheus operator 
* Prometheus cluster
* Alert manager
* Node-exporter
* Metrics-server
* ArgoCd
* Grafana
* Elk-operator
* ElasticSearch
* Kibana
* Example application for logs
* Example application for metrics
* Fluent-bit operator
* Fluent-bit deamonset
* Weave-scope
## Getting started

First, we will need to set few DNS records in ```/etc/hosts``` file to be able access the cluster components
```aidl
127.0.0.1 app.kubernetes.local
127.0.0.1 grafana.kubernetes.local
127.0.0.1 prometheus.kubernetes.local
127.0.0.1 traefik.kubernetes.local
127.0.0.1 weave-scope.kubernetes.local
127.0.0.1 elasticsearch.kubernetes.local
127.0.0.1 kibana.kubernetes.local
127.0.0.1 argo.kubernetes.local
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

To get the web-ui ArgoCd password (for admin user) , run :
```
kubectl get pods -n cd -l app.kubernetes.io/name=argocd-server -o name | cut -d'/' -f 2
```
