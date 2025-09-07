# If upgrading an existing Cilium installation:
cilium upgrade --version 1.18.1 \
               --set egressGateway.enabled=true \
               --set ipv4Masquerade=true \
               --set bpfMasquerade=true

# OR, for a fresh install:
cilium install --version 1.18.1 \
--set egressGateway.enabled=true \
--set ipv4Masquerade=true \
--set bpfMasquerade=true 