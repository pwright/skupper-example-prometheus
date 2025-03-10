#REPOSITORY := quay.io/skupper/simple-prom-metrics
REPO := quay.io/skupper/simple-prom-metrics
IMAGE := simple-prom-metrics

.PHONY: build
build:
	go build -o ${IMAGE} .

.PHONY: docker
docker: build
	docker build -t ${REPO}:v2 .

.PHONY: run
run: docker
	docker run -p 8080:8080 ${REPO}

# Prerequisite: docker login quay.io
.PHONY: push
push: docker
	docker push ${REPO}:v2
