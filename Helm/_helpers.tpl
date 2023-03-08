{{/* 
cronjob, deployment and service extraLabels
*/}}
{{- define "generic-chart.extraLabels" -}}
{{- if .extraLabels }}
{{- range $key, $value := .extraLabels }}
{{ $key }}: {{ $value }}
{{- end }}
{{- end }}
{{- end }} 

{{/* 
cronjob, deployment and service extraMetadataLabels
*/}}
{{- define "generic-chart.extraMetadataLabels" -}}
{{- if .extraMetadataLabels }}
{{- range $key, $value := .extraMetadataLabels }}
{{ $key }}: {{ $value }}
{{- end }}
{{- end }}
{{- end }} 

{{/* 
cronjob, deployment and job environment variables
*/}}
{{- define "generic-chart.envvars" -}}
{{- if .env.normalenv }}
{{- range $key, $value := .env.normalenv }}
- name: {{ $key }} 
  value: {{ $value | quote }}
{{- end }}
{{- end }}
{{- if .env.secretenv }}
{{- range $key, $value := .env.secretenv }}
- name: {{ $key }} 
  valueFrom:
    secretKeyRef:
      key: {{ .key }}
      name: {{ .name }}
{{- end }}
{{- end }}
{{- end }} 
