{{/*
Return base chart name
*/}}
{{- define "etcd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Return the full name of the release.
We want pods like: <release>-0, so fullname = .Release.Name by default.
*/}}
{{- define "etcd.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Build the initial cluster string based on replicaCount.

For release "eventsse-etcd" and replicaCount=3 this renders to:
eventsse-etcd-0=$(URI_SCHEME)://eventsse-etcd-0.eventsse-etcd:2380,eventsse-etcd-1=...,eventsse-etcd-2=...
*/}}
{{- define "etcd.initialCluster" -}}
{{- $name := include "etcd.fullname" . -}}
{{- $replicas := int .Values.replicaCount -}}
{{- range $i, $e := until $replicas -}}
{{- if gt $i 0 }},{{ end -}}
{{ $name }}-{{ $i }}=$(URI_SCHEME)://{{ $name }}-{{ $i }}.{{ $name }}:2380
{{- end -}}
{{- end }}
