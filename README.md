# Start project

## Kubernetes

### (optional) Clean minikube

if you need to clear every minikube images :
```
minikube delete --all
```

### build minikube images

open your terminal and run this command : 
```
minikube image build ./nginx -t nginx:latest && minikube image build ./result -t result:latest && minikube image build ./seed-data -t seed-data:latest && minikube image build ./vote -t vote:latest && minikube image build ./worker -t worker:latest
```

### start a minikube tunnel

open a second cmd (or powershell) and open a minikube tunnel by running this command :
```
minikube tunnel
```

keep this command window open

### apply kustomization

run these command to deploy every resources
```
Kubectl apply -k ./kube
```

### verifications

you can run these two commands to see if anything run perfectly
```
kubectl get svc
```
```
kubectl get pods
```

### (optional) shutdown every resources

if you want to delete all the resources
```
Kubectl delete -k ./kube
```