kind create cluster --name multi-node --config kind-config.yaml
kubectl create -f https://raw.githubusercontent.com/cilium/cilium/v1.15/install/kubernetes/quick-install.yaml