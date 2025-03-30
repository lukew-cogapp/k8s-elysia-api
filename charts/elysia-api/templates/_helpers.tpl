{{- define "elysia-api.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "elysia-api.name" -}}
{{- .Chart.Name -}}
{{- end -}}