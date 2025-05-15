# Preliminary
We suppose you have docker and kubernetes installed and configured on your environment, and also that you are using windows or linux.

# Starting the whole project
Firstly, start the kubernetes cluster by running the 2 following commands at the root of the project, in 2 different cli:
```
minikube start && minikube tunnel
minikube image build ./nginx -t nginx:latest && minikube image build ./result -t result:latest && minikube image build ./seed-data -t seed-data:latest && minikube image build ./vote -t vote:latest && minikube image build ./worker -t worker:latest && Kubectl apply -k ./kube
```
NB: seed-job is "line break sensitive", as we are editing the file on windows but running it on linux container, the pod might not recognize the file at run time, make sure to not change it :)

That's it !

don't forget to :
- vote [here](https://localhost:8080) 
- and watch results [here](https://localhost:4000)

PS : The database is not designed to save entries at each restart, hence every inserted votes won't be kept in memory.


# Bonus commands

## kubernetes
```
minikube start

minikube image build ./nginx -t nginx:latest && minikube image build ./result -t result:latest && minikube image build ./seed-data -t seed-data:latest && minikube image build ./vote -t vote:latest && minikube image build ./worker -t worker:latest

minikube tunnel

kubectl get svc/pod/...

kubectl logs <pod-name>

Kubectl apply -k ./kube

Kubectl delete -k ./kube

kubectl delete all --all

minikube delete --all
```
## ansible
```
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventories/openstack.yaml ./playbook-db.yml

ansible-playbook .\playbook-db.yaml

docker run postgres pg_isready --host=10.129.178.171

ansible -m setup vm1
```