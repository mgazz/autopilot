.PHONY: gpu-bw-image
gpu-bw-image:
	docker build -t pcie-test:dev -f gpu-bw-test/Dockerfile gpu-bw-test/

.PHONY: gpu-mem-image
gpu-mem-image:
	docker build -t gpu-memcheck:dev -f gpu-mem-test/Dockerfile gpu-mem-test/

.PHONY: install
install:
	helm install mw-v0 autopilot-mutating-webhook/helm-charts/mutating-webhook
	helm install hrr-v0 healthcheckoperator/helm-charts/healthcheckoperator

.PHONY: uninstall
uninstall:
	helm uninstall hrr-v0
	helm uninstall mw-v0

.PHONY: submodule-init
submodule-init:
	git submodule update --init --recursive
