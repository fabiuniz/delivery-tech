#!/bin/bash
# ==============================================================================
# up.sh — Script de Build e Execucao: $PROJECT_NAME
# Projeto : $PROJECT_CODE
# Curso   : $COURSE_NAME
# Gerado  : $(date +"%d/%m/%Y")
# ==============================================================================
# USO: bash up.sh [--clean] [--skip-build] [--port PORTA]
#   --clean         Remove o diretorio target/ antes de buildar
#   --skip-build    Pula o Maven (usa o JAR ja existente em target/)
#   --port PORTA    Sobrescreve a porta padrao (padrao: $SERVER_PORT)
# ==============================================================================
set -e
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
clear

# =====================================================================
# 0. Flags de execucao
# =====================================================================
CLEAN_BUILD=false
SKIP_BUILD=false
APP_PORT="$SERVER_PORT"
IP_HOST="vmlinuxd"

while [[ $# -gt 0 ]]; do
    case "$1" in
        --clean)       CLEAN_BUILD=true; shift ;;
        --skip-build)  SKIP_BUILD=true;  shift ;;
        --port)        APP_PORT="$2";    shift 2 ;;
        *) echo "[AVISO] Flag desconhecida: $1"; shift ;;
    esac
done

# =====================================================================
# 1. Configuracoes (preenchidas automaticamente pelo MakeProject.sh)
# =====================================================================
APP_PORT="${APP_PORT:-$SERVER_PORT}"
JAR_FILE="target/$ARTIFACT_ID-1.0.0-SNAPSHOT.jar"

echo "=============================================================="
echo "  [INFO] $PROJECT_NAME - Script de Inicializacao"
echo "  [ARTEFATO] $ARTIFACT_ID"
echo "  [PORTA]    ${APP_PORT}"
echo "  [PROJETO]  $PROJECT_CODE"
echo "=============================================================="

# =====================================================================
# 2. Pre-requisitos
# =====================================================================
echo ""
echo "[CHECK] Verificando pre-requisitos..."

if ! command -v java &>/dev/null; then
    echo "[ERRO] Java nao encontrado. Instale o JDK 17+:"
    echo "       https://adoptium.net/ ou: sudo apt install openjdk-17-jdk"
    exit 1
fi
JAVA_VER=$(java -version 2>&1 | awk -F '"' '/version/ {print $2}' | cut -d'.' -f1)
if [ "$JAVA_VER" -lt 17 ]; then
    echo "[ERRO] Java ${JAVA_VER} detectado. Requer Java 17 ou superior."
    exit 1
fi
echo "  [OK] Java ${JAVA_VER}"

if ! command -v mvn &>/dev/null; then
    echo "[ERRO] Maven nao encontrado. Instale:"
    echo "       https://maven.apache.org/download.cgi ou: sudo apt install maven"
    exit 1
fi
echo "  [OK] Maven $(mvn -q --version | head -1)"

# =====================================================================
# 3. Verificar se a porta ja esta em uso e matar processo anterior
# =====================================================================
echo ""
echo "[CHECK] Verificando porta ${APP_PORT}..."
OLD_PID=$(lsof -ti tcp:${APP_PORT} 2>/dev/null || true)
if [ -n "$OLD_PID" ]; then
    echo "  [AVISO] Porta ${APP_PORT} ocupada (PID ${OLD_PID}). Encerrando processo..."
    kill -9 "$OLD_PID" 2>/dev/null || true
    sleep 1
fi
echo "  [OK] Porta ${APP_PORT} disponivel"

# =====================================================================
# 4. Build com Maven
# =====================================================================
if [ "$SKIP_BUILD" = true ]; then
    echo ""
    echo "[INFO] Build ignorado (--skip-build). Usando JAR existente: ${JAR_FILE}"
    if [ ! -f "$JAR_FILE" ]; then
        echo "[ERRO] JAR nao encontrado em ${JAR_FILE}. Execute sem --skip-build primeiro."
        exit 1
    fi
else
    echo ""
    if [ "$CLEAN_BUILD" = true ]; then
        echo "[INFO] Limpeza completa do target/ (--clean)..."
        mvn clean -q
    fi

    echo "[BUILD] Compilando e empacotando com Maven (pode demorar na 1a vez)..."
    mvn package -DskipTests -q
    echo "  [OK] Build concluido -> ${JAR_FILE}"
fi

# =====================================================================
# 5. Execucao da aplicacao Spring Boot
# =====================================================================
echo ""
echo "[RUN] Iniciando $PROJECT_NAME na porta ${APP_PORT}..."
echo "  - API REST   : http://${IP_HOST}:${APP_PORT}/api/$MAIN_ENTITY_TABLE"
echo "  - Console H2 : http://${IP_HOST}:${APP_PORT}/h2-console"
echo "  - Health     : http://${IP_HOST}:${APP_PORT}/actuator/health"
echo ""
echo "  Pressione Ctrl+C para encerrar."
echo "--------------------------------------------------------------"

java -jar "$JAR_FILE" \
    --server.port="${APP_PORT}" \
    --spring.profiles.active=dev