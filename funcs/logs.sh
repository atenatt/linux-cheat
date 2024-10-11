#!/bin/bash

# Obtém o diretório do script atual
script_dir=$(cd "$(dirname "$0")" && pwd)

# Lê as configurações do arquivo config.cnf
while IFS='=' read -r key value; do
  [[ "$key" =~ ^\[.*\]$ ]] && continue # Ignora linhas de seção
  [[ -z "$key" || "$key" =~ ^#.* ]] && continue # Ignora linhas vazias ou comentários
  declare -g "$key"="$value"
done < <(awk -F'=' '{gsub(/ /,"",$1); gsub(/ /,"",$2); print}' "${script_dir}/config.cnf")

# Função para registrar mensagens de log
log_message() {
    local log_level="$1"
    local log_message="$2"
    local timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    local script_name="${BASH_SOURCE[1]##*/}"  # Obtém o nome do script de chamada
    local pid="$$"  # Obtém o PID do processo atual
    local user=$(whoami)  # Obtém o nome do usuário atual

    # Verificando se o diretório de log existe
    if [[ ! -d "${log_dir}" ]]; then
        echo "Erro: Diretório de log '${log_dir}' não encontrado." >&2
        exit 1
    fi

    # Formata a mensagem de log 
    echo "$timestamp [$script_name][$pid][$user] [$log_level] $log_message" >> "${log_dir}/${main_log_file}"
}