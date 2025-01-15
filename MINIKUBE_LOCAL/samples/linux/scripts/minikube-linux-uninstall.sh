
SYSTEM_PASSWORD=$1

main() {
    local MINIKUBE_COMMAND="minikube"
    local IS_MINIKUBE_INSTALLED=$(command -v ${MINIKUBE_COMMAND})

    # Verifica se já existe uma versão do minikube instalada
    if [[ ${IS_MINIKUBE_INSTALLED} ]]
    then
        echo "# Removendo instância do Minikube"
        minikube delete

        local MINIKUBE_FOLDER=$(command -v ${MINIKUBE_COMMAND})
        if [[ ${MINIKUBE_FOLDER} ]]; then
            echo "# Removendo arquivos do Minikube..."
            echo "${SYSTEM_PASSWORD}" | sudo -S rm -f ${MINIKUBE_FOLDER}
            hash -d ${MINIKUBE_COMMAND}
            echo "# Arquivos do minikube removidos."
        fi
    fi
}

main