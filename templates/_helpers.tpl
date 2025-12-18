{{/*
Expand the name of the chart.
*/}}
{{- define "threescale.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "threescale.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "threescale.labels" -}}
helm.sh/chart: {{ include "threescale.chart" . }}
{{ include "threescale.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "threescale.selectorLabels" -}}
app.kubernetes.io/name: {{ include "threescale.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Operator Label
*/}}
{{- define "threescale.operatorLabel" -}}
{{- if .Values.namespace }}
operators.coreos.com/3scale-operator.{{ .Values.namespace }}: ''
{{- else }}
operators.coreos.com/3scale-operator.{{ .Values.name }}: ''
{{- end }}
{{- end }}
