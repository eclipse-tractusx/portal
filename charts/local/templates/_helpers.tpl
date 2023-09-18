{{/*
* Copyright (c) 2021, 2023 Contributors to the Eclipse Foundation
*
* See the NOTICE file(s) distributed with this work for additional
* information regarding copyright ownership.
*
* This program and the accompanying materials are made available under the
* terms of the Apache License, Version 2.0 which is available at
* https://www.apache.org/licenses/LICENSE-2.0.
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
* WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
* License for the specific language governing permissions and limitations
* under the License.
*
* SPDX-License-Identifier: Apache-2.0

Postgresql is a dependency of a dependency, which resulted in an empty .Chart.Name..
Therefore, setting the chart name statically for the relevant resources.
*/}}

{{- define "postgresql.primary.fullname" -}}
{{- if eq .Values.architecture "replication" }}
    {{- printf "%s-primary" (include "chart-name-postgresql-dependency" .) | trunc 63 | trimSuffix "-" -}}
{{- else -}}
    {{- include "chart-name-postgresql-dependency" . -}}
{{- end -}}
{{- end -}}

{{- define "postgresql.readReplica.fullname" -}}
{{- printf "%s-read" (include "chart-name-postgresql-dependency" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "chart-name-postgresql-dependency" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default "postgresql" .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}
