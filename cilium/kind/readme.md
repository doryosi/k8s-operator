# Useful commands to work with kind
```bash
# Add ipv4 forwarding and masquerade 
sysctl -w net.ipv4.ip_forward=1
sysctl -w net.ipv4.conf.all.forwarding=1
sysctl -w net.ipv4.conf.all.rp_filter=0

# Removae all cilium crds
kubectl get crd | grep cilium.io | awk '{print $1}' | xargs kubectl delete crd

# Create kind Cluster using yaml manifest
kind create cluster --name kind-vpn-test --config cilium/kind/kind-config.yaml

## 1. Build the controller image and load it into kind:
docker build -t vpn-operator:dev .
kind load docker-image vpn-operator:dev --name $(kind get clusters)

## 2. Update your controller deployment manifest:
## Edit the deployment YAML (usually in config/manager/manager.yaml or similar) to use the ## vpn-operator:dev image.

## 3. Apply the manifests to your kind cluster:
## Deploy CRDs, RBAC, and the controller:
kubectl apply -k config/crd/
kubectl apply -k config/rbac/
kubectl apply -k config/manager/

```
