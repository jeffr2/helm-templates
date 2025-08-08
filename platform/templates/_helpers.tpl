{{/*
Retorna nome com sufixo opcional.
Uso: include "platform.named" (dict "name" . "suffix" "pvc")
*/}}
{{- define "platform.named" -}}
{{- $name := .name -}}
{{- if .suffix }}
{{- printf "%s-%s" $name .suffix }}
{{- else }}
{{- $name }}
{{- end }}
{{- end }}

{{/*
Retorna fullname baseado em:
- workload.deployment.name (ou workload.cronjob.name, caso queira adaptar)
- se vazio, usa .Release.Name
*/}}
{{- define "platform.fullname" -}}
{{- $w := .Values.workload -}}
{{- if and $w.deployment.enabled (ne $w.deployment.name "") }}
{{- $w.deployment.name }}
{{- else if and $w.cronjob.enabled (ne $w.cronjob.name "") }}
{{- $w.cronjob.name }}
{{- else }}
{{- .Release.Name }}
{{- end }}
{{- end }}
