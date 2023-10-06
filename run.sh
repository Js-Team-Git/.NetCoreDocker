#!/bin/bash
export OTEL_EXPORTER_OTLP_ENDPOINT=https://c927b4346b8a46bfb634439f0a75572e.apm.us-central1.gcp.cloud.es.io:443
export OTEL_EXPORTER_OTLP_HEADERS="Authorization=Bearer LYtoaASLSGfMduNJOL"
export OTEL_METRICS_EXPORTER=otlp
export OTEL_LOGS_EXPORTER=otlp

docker run -v /tmp/otel-collector-config.yaml:/etc/otel-collector-config.yaml \ -e 
OTEL_EXPORTER_OTLP_ENDPOINT="${OTEL_EXPORTER_OTLP_ENDPOINT}" \ -e 
OTEL_EXPORTER_OTLP_HEADERS="${OTEL_EXPORTER_OTLP_HEADERS}" \ -e 
OTEL_METRICS_EXPORTER="${OTEL_METRICS_EXPORTER}" \ -e 
OTEL_LOGS_EXPORTER="${OTEL_LOGS_EXPORTER}" \ otel/opentelemetry-collector:latest \ --config=/etc/otel-collector-config.yaml

dotnet build DockeroDummy.dll
dotnet run DockeroDummy.dll
