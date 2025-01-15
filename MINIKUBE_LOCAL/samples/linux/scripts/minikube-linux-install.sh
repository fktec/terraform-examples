
SYSTEM_PASSWORD=$1
OPERATING_SYSTEM=$2
SYSTEM_ARCHITECTURE=$3
MINIKUBE_INSTALL_FORCE_CONDITION="$4"


main() {
    local MINIKUBE_COMMAND="minikube"
    local MINIKUBE_INSTALL_FILE_NAME="minikube-${OPERATING_SYSTEM}-${SYSTEM_ARCHITECTURE}"
    local HAS_MINIKUBE_VERSION=$(command -v ${MINIKUBE_COMMAND})

    # Verifica se já existe uma versão do minikube instalada
    if [[ ${HAS_MINIKUBE_VERSION} ]]
    then
        if ! [[ ${MINIKUBE_INSTALL_FORCE_CONDITION} ]]; then
            read -p "# Já existe uma versão do Minikube instalado localmente, deseja continuar (s/n): " MINIKUBE_INSTALL_FORCE_CONDITION
        fi

        if [[ ${MINIKUBE_INSTALL_FORCE_CONDITION} == "n" ]]; then
            echo "- Minikube já instalado, instalação cancelada."
            exit 0
        elif ! [[ ${MINIKUBE_INSTALL_FORCE_CONDITION} == "s" ]]; then
            echo "- Opção inválida. Escolha apenas 's' ou 'n'"
            exit 0
        fi
    fi

    install_dependencies

    echo ""
    echo "- Baixando arquivo de instalação do Minikube..."
    local RESPONSE=$(http_request "https://github.com/kubernetes/minikube/releases/latest/download/${MINIKUBE_INSTALL_FILE_NAME}" "GET" "" "-LO")
    local RESPONSE_STATUS_CODE=$(echo "${RESPONSE}" | jq '.statusCode')

    if [[ ${RESPONSE_STATUS_CODE} == 200 ]]; then
        echo ""
        echo "- Download do arquivo de instalação do Minikube finalizado."

        echo ""
        echo "- Instalando Minikube..."
        local MINIKUBE_INSTALL_RESPONSE=$(echo "${SYSTEM_PASSWORD}" | sudo -S install ${MINIKUBE_INSTALL_FILE_NAME} /usr/local/bin/minikube && rm ${MINIKUBE_INSTALL_FILE_NAME})

        local MINIKUBE_CLI_VERSION_INSTALLED=$(command -v ${MINIKUBE_COMMAND})
        if [[ ${MINIKUBE_CLI_VERSION_INSTALLED} ]]; then
            echo ""
            echo "# Instalacão do Minikube finalizada."
            ${MINIKUBE_COMMAND} version
        else
            echo ""
            echo "# Não foi possível realizar a instalação do Minikube."
        fi
    fi

}

http_request() {
    local URL="$1"
    local HTTP_METHOD="$2"
    local HTTP_HEADERS="$3"
    local CURL_EXTRA_OPTIONS="$4"

    local RESPONSE=$(curl ${CURL_EXTRA_OPTIONS} -w "\n%{http_code}" --location --request ${HTTP_METHOD} ${URL} --header "${HTTP_HEADERS}")
    local STATUS_CODE=$(echo "$RESPONSE" | tail -n 1)
    local BODY=$(echo "$RESPONSE" | sed '$d')

    printf '{\n  "statusCode": %s,\n  "body": %s\n}\n' "$STATUS_CODE" "${BODY:=null}"
}

install_dependencies() {
    echo "# Instalando algumas dependências..."

    if ! command -v apt-get &> /dev/null; then
        echo "# Instalando >> apt-get"
        echo "${SYSTEM_PASSWORD}" | sudo -S apt install apt
    fi

    if ! command -v jq &> /dev/null; then
        echo "# Instalando >> jq"
        echo "${SYSTEM_PASSWORD}" | sudo -S apt-get install jq=1.6-2.1ubuntu3
    fi

    echo "# Instalação das dependências finalizada."
}

main