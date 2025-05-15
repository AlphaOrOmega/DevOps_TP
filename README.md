# Preliminary
We suppose you have docker, kubernetes and ansible installed and configured on your environment, and also that you are using windows or linux.

# Starting the whole project
To start the database using ansible, run the following command from the root of the project :
```
ansible-playbook -i ansible/inventories/openstack.yaml ./ansible/playbook-db.yml
```
Then, start the kubernetes part of the project by running the 2 following commands at root of the project, in 2 different cli:
```
minikube start && minikube tunnel
minikube image build ./nginx -t nginx:latest && minikube image build ./result -t result:latest && minikube image build ./seed-data -t seed-data:latest && minikube image build ./vote -t vote:latest && minikube image build ./worker -t worker:latest && Kubectl create -k ./kube
```
Finally, to perform saves of the db on a cold replica, run the 2 following commands from the root of the project :
```
ansible-playbook -i ansible/inventories/openstack.yaml ./ansible/playbook-keys.yml
ansible-playbook -i ansible/inventories/openstack.yaml ./ansible/playbook-backup.yml
```

That's it !
don't forget to
- vote at localhost:8080
- and watch results localhost:4000

PS : the database is not designed to delete entries, hence every inserted votes prior remains.



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