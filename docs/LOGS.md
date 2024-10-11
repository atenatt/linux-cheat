# Estrutura de Logs

Este documento descreve a estrutura das mensagens de log geradas pelos scripts deste projeto.

## Formato das Mensagens de Log

Cada mensagem de log segue o seguinte formato:

```bash
timestamp [script_name][pid][user] [log_level] log_message
```

Onde:

* **`timestamp`:** Data e hora do evento no formato `AAAA-MM-DD HH:MM:SS`.
* **`script_name`:** Nome do script que gerou a mensagem de log.
* **`pid`:** ID do processo (PID) do script que gerou a mensagem.
* **`user`:** Nome do usuário que executou o script.
* **`log_level`:** Nível de severidade da mensagem de log. Os seguintes níveis são usados:
    * `INFO`: Informações gerais sobre a execução do script.
    * `WARNING`: Alerta sobre um possível problema que não impediu a execução do script, mas que pode indicar um problema futuro.
    * `ERROR`: Erro crítico que impediu a execução do script ou que resultou em um comportamento inesperado.
* **`log_message`:** Descrição detalhada do evento que está sendo registrado.

## Exemplo de Mensagem de Log

```bash
2023-12-19 12:34:56 [main.sh][1234][user] [INFO] Iniciando o script principal...
```

## Localização dos Arquivos de Log

Os arquivos de log são salvos no diretório `logs/`, localizado na raiz do projeto. O nome do arquivo de log principal é definido na variável `main_log_file` no arquivo `config.cnf`.