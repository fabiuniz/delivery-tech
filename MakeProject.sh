#!/bin/bash

# ==============================================================================
# GARANTIA DE CODIFICAÇÃO UTF-8 GLOBAL (Evita mojibake em ambientes Windows/MSYS)
# ==============================================================================
export LANG="C.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_ALL="C.UTF-8"
export LC_CTYPE="C.UTF-8"

# ==============================================================================
# Script de Inicialização Baseado em Templates (.tpl) e Totalmente Dinâmico
# Com Suporte Nativo a Windows UTF-8 (BOM em Documentação) e Proteção contra Sobrescrita
# Uso: ./MakeProject.sh [arquivo.cfg]
# Documentação Completa: Veja o arquivo README.md nesta mesma pasta
# ==============================================================================

# Se nenhum parâmetro for passado, usa 'projeto.cfg' como padrão
CONFIG_FILE="${1:-projeto.cfg}"
TEMPLATES_DIR="templates"

# Se o arquivo de configuração não existir, cria um modelo completo com instruções
if [ ! -f "$CONFIG_FILE" ]; then
    echo "⚠️ Aviso: Arquivo '$CONFIG_FILE' não encontrado. Gerando modelo com todos os parâmetros..."
    cat << 'EOF' > "$CONFIG_FILE"
# ==============================================================================
# ARQUIVO DE CONFIGURAÇÃO DINÂMICA DO PROJETO (.cfg)
# ==============================================================================
# Este arquivo é o cérebro da automação. Qualquer alteração feita aqui será 
# refletida automaticamente em todos os templates de gestão (Markdown) e no
# código-fonte Java (Spring Boot) na próxima criação de projeto.
#
# DICA DE MANUTENÇÃO:
# Para criar um projeto novo, basta duplicar este arquivo (ex: oficina.cfg),
# alterar os valores abaixo e rodar: ./MakeProject.sh oficina.cfg
# ==============================================================================

# ==============================================================================
# 1. CONFIGURAÇÕES GERAIS DO PROJETO (Identificação e Gestão de Prazos)
# ==============================================================================
# - PROJECT_NAME: Nome oficial do produto ou startup (usado em títulos e no pom.xml).
# - PROJECT_DIR: Nome da pasta raiz onde o projeto será criado fisicamente no disco.
# - COURSE_NAME: Nome completo da disciplina, instituição e turma.
# - PROJECT_CODE: Código identificador formal do projeto nos relatórios.
# - PROJECT_MANAGER: Nome do Gerente do Projeto ou líder responsável pela entrega.
# - START_DATE: Data de início das atividades (formato: DD/MM/AAAA).
# - END_DATE: Data de término / encerramento formal do cronograma.

PROJECT_NAME="Delivery-tech"
PROJECT_DIR="delivery-tech-complete"
COURSE_NAME="Gestão de Projetos de TI (Qualifica São Paulo / Fundação FAT — Turma T9)"
PROJECT_CODE="QSP-GPTI-T9-Delivery"
PROJECT_MANAGER="Fabiano Rocha"
START_DATE="05/11/2026"
END_DATE="17/12/2026"

# ==============================================================================
# 2. CONFIGURAÇÕES DE NEGÓCIO / DOMÍNIO (Gestão Ágil, TAP e Escopo)
# ==============================================================================
# - BUSINESS_SEGMENT: Área de atuação ou mercado do produto (ex: "Logística Automotiva").
# - TARGET_AUDIENCE: Quem são os usuários finais atendidos.
# - VALUE_PROPOSITION: Declaração de valor único e transformação gerada pelo produto.
# - OUT_OF_SCOPE_DEF: O que deliberadamente NÃO será feito nesta primeira versão.

BUSINESS_SEGMENT="Delivery de Alimentos e Refeições"
TARGET_AUDIENCE="Consumidores, restaurantes locais e entregadores autônomos"
VALUE_PROPOSITION="conectar clientes, estabelecimentos e entregadores locais com transparência, segurança e agilidade"
OUT_OF_SCOPE_DEF="Frota física própria de entregadores nesta primeira fase."

# ==============================================================================
# 3. CONFIGURAÇÕES TÉCNICAS (Java, Spring Boot e Persistência)
# ==============================================================================
# - PACKAGE_BASE: Pacote raiz Java (as pastas serão criadas dinamicamente).
# - GROUP_ID: Identificador de grupo no pom.xml (geralmente igual a PACKAGE_BASE).
# - ARTIFACT_ID: Nome do artefato / jar do projeto no pom.xml.
# - MAIN_ENTITY: Nome da classe da entidade principal em PascalCase (ex: Pedido, Consulta).
# - MAIN_ENTITY_TABLE: Nome da tabela correspondente no banco relacional (ex: tb_pedido).
# - SERVER_PORT: Porta TCP onde a aplicação Spring Boot subirá localmente (padrão: 8080).

PACKAGE_BASE="com.deliverytech"
GROUP_ID="com.deliverytech"
ARTIFACT_ID="deliverytech-api"
MAIN_ENTITY="Pedido"
MAIN_ENTITY_TABLE="tb_pedido"
SERVER_PORT="8080"
EOF
    echo "✅ Arquivo '$CONFIG_FILE' gerado com sucesso!"
fi

echo "📖 Lendo as configurações de '$CONFIG_FILE'..."
# Exporta automaticamente as variáveis lidas do arquivo .cfg como variáveis de ambiente UTF-8
set -a
source "$CONFIG_FILE"
set +a

# ==============================================================================
# FALLBACKS INTELIGENTES (Garante compatibilidade total com configs legadas)
# ==============================================================================
export PROJECT_NAME="${PROJECT_NAME:-Delivery-tech}"
export PROJECT_DIR="${PROJECT_DIR:-delivery-tech-complete}"
export COURSE_NAME="${COURSE_NAME:-Gestão de Projetos de TI (Qualifica São Paulo / Fundação FAT — Turma T9)}"
export PROJECT_CODE="${PROJECT_CODE:-QSP-GPTI-T9-Delivery}"
export PROJECT_MANAGER="${PROJECT_MANAGER:-Fabiano Rocha}"
export START_DATE="${START_DATE:-05/11/2026}"
export END_DATE="${END_DATE:-17/12/2026}"
export SERVER_PORT="${SERVER_PORT:-8080}"

export BUSINESS_SEGMENT="${BUSINESS_SEGMENT:-Delivery de Alimentos}"
export TARGET_AUDIENCE="${TARGET_AUDIENCE:-consumidores e parceiros locais}"
export VALUE_PROPOSITION="${VALUE_PROPOSITION:-conectar clientes e parceiros com transparência, pagamentos seguros e alta eficiência}"
export OUT_OF_SCOPE_DEF="${OUT_OF_SCOPE_DEF:-Frota física própria de entregadores nesta primeira fase.}"

export PACKAGE_BASE="${PACKAGE_BASE:-com.deliverytech}"
export GROUP_ID="${GROUP_ID:-$PACKAGE_BASE}"
export ARTIFACT_ID="${ARTIFACT_ID:-api-service}"
export MAIN_ENTITY="${MAIN_ENTITY:-Pedido}"
export APPLICATION_NAME="${APPLICATION_NAME:-DeliveryTech}"
export MAIN_ENTITY_TABLE="${MAIN_ENTITY_TABLE:-tb_pedido}"

# Parâmetros derivados
export PACKAGE_PATH=$(echo "$PACKAGE_BASE" | tr '.' '/')
export ENDPOINT_NAME=$(echo "$MAIN_ENTITY" | tr '[:upper:]' '[:lower:]')s

echo "🚀 Iniciando orquestração do projeto '$PROJECT_NAME' em '$PROJECT_DIR'..."

# ==============================================================================
# FUNÇÃO DE RENDERIZAÇÃO DE TEMPLATES COM PROTEÇÃO CONTRA SOBRESCRITA E BOM UTF-8
# ==============================================================================
render_template() {
    local tpl_path="$1"
    local dest_path="$2"

    # Se o arquivo já existe no destino, não sobrescreve
    if [ -f "$dest_path" ]; then
        echo "⏭️ Pulado: $dest_path (já existe e foi preservado)"
        return 0
    fi

    # Garante que o diretório de destino existe
    mkdir -p "$(dirname "$dest_path")"

    # Valida se o template existe
    if [ ! -f "$tpl_path" ]; then
        echo "❌ Erro: Template '$tpl_path' não encontrado!"
        return 1
    fi

    # Variáveis do .cfg que o envsubst deve substituir — APENAS estas.
    # Qualquer outra ${VAR} no template (ex: ${APP_PORT}, ${SKIP_BUILD}) é do script gerado
    # e deve ser preservada intacta. Passando a lista explícita ao envsubst, isso é garantido.
    local CFG_VARS='$PROJECT_NAME:$PROJECT_DIR:$COURSE_NAME:$PROJECT_CODE:$PROJECT_MANAGER:$START_DATE:$END_DATE:$BUSINESS_SEGMENT:$TARGET_AUDIENCE:$VALUE_PROPOSITION:$OUT_OF_SCOPE_DEF:$PACKAGE_BASE:$PACKAGE_PATH:$GROUP_ID:$ARTIFACT_ID:$MAIN_ENTITY_TABLE:$MAIN_ENTITY:$SERVER_PORT:$ENDPOINT_NAME:$APPLICATION_NAME'

    # Arquivos de documentação Markdown (.md) e texto recebem o cabeçalho UTF-8 BOM (\xef\xbb\xbf)
    # Isso garante compatibilidade 100% nativa com ferramentas Windows (Word, Notepad, PowerShell, Office)
    if [[ "$dest_path" == *.md ]] || [[ "$dest_path" == *.txt ]] || [[ "$dest_path" == *.doc ]]; then
        printf '\xef\xbb\xbf' > "$dest_path"
        envsubst "$CFG_VARS" < "$tpl_path" >> "$dest_path"
    else
        # Código-fonte Java, XML, properties e scripts (.sh) permanecem UTF-8 sem BOM
        # (compatibilidade com Maven, javac e bash — BOM quebra o shebang #!/bin/bash)
        envsubst "$CFG_VARS" < "$tpl_path" > "$dest_path"
    fi

    echo "📄 Gerado a partir de template: $dest_path"
}

# ==============================================================================
# 1. RENDERIZAÇÃO DA DOCUMENTAÇÃO DE GESTÃO (Espelhada na pasta templates/)
# ==============================================================================
render_template "$TEMPLATES_DIR/01-Iniciacao/Termo_Abertura_Projeto.md.tpl" \
                "$PROJECT_DIR/01-Iniciacao/Termo_Abertura_Projeto.md"

render_template "$TEMPLATES_DIR/02-Planejamento/Governanca/Encontro_04_Governanca_Scrum.md.tpl" \
                "$PROJECT_DIR/02-Planejamento/Governanca/Encontro_04_Governanca_Scrum.md"

render_template "$TEMPLATES_DIR/02-Planejamento/Escopo/Escopo_Projeto.md.tpl" \
                "$PROJECT_DIR/02-Planejamento/Escopo/Escopo_Projeto.md"

render_template "$TEMPLATES_DIR/02-Planejamento/Arquitetura-Tecnica/Especificacao_Arquitetura.md.tpl" \
                "$PROJECT_DIR/02-Planejamento/Arquitetura-Tecnica/Especificacao_Arquitetura.md"

render_template "$TEMPLATES_DIR/02-Planejamento/Backlog-Sprints/Product_Backlog.md.tpl" \
                "$PROJECT_DIR/02-Planejamento/Backlog-Sprints/Product_Backlog.md"

render_template "$TEMPLATES_DIR/02-Planejamento/Riscos/Registro_Riscos.md.tpl" \
                "$PROJECT_DIR/02-Planejamento/Riscos/Registro_Riscos.md"

render_template "$TEMPLATES_DIR/02-Planejamento/Stakeholders/Registro_Stakeholders.md.tpl" \
                "$PROJECT_DIR/02-Planejamento/Stakeholders/Registro_Stakeholders.md"

# ==============================================================================
# 2. RENDERIZAÇÃO DO CÓDIGO-FONTE JAVA / SPRING BOOT (Espelhada na pasta templates/)
# ==============================================================================
render_template "$TEMPLATES_DIR/03-Execucao/sftp-config.tpl" \
                "$PROJECT_DIR/03-Execucao/sftp-config.json"

render_template "$TEMPLATES_DIR/03-Execucao/pom.xml.tpl" \
                "$PROJECT_DIR/03-Execucao/pom.xml"

render_template "$TEMPLATES_DIR/03-Execucao/up.tpl" \
                "$PROJECT_DIR/03-Execucao/up.sh"

render_template "$TEMPLATES_DIR/03-Execucao/src/main/resources/application.properties.tpl" \
                "$PROJECT_DIR/03-Execucao/src/main/resources/application.properties"

render_template "$TEMPLATES_DIR/03-Execucao/src/main/resources/static/index.tpl" \
                "$PROJECT_DIR/03-Execucao/src/main/resources/static/index.html"                

render_template "$TEMPLATES_DIR/03-Execucao/src/main/java/model/Model.java.tpl" \
                "$PROJECT_DIR/03-Execucao/src/main/java/$PACKAGE_PATH/model/${MAIN_ENTITY}.java"

render_template "$TEMPLATES_DIR/03-Execucao/src/main/java/dao/Repository.java.tpl" \
                "$PROJECT_DIR/03-Execucao/src/main/java/$PACKAGE_PATH/dao/${MAIN_ENTITY}Repository.java"

render_template "$TEMPLATES_DIR/03-Execucao/src/main/java/service/Service.java.tpl" \
                "$PROJECT_DIR/03-Execucao/src/main/java/$PACKAGE_PATH/service/${MAIN_ENTITY}Service.java"

render_template "$TEMPLATES_DIR/03-Execucao/src/main/java/controller/Controller.java.tpl" \
                "$PROJECT_DIR/03-Execucao/src/main/java/$PACKAGE_PATH/controller/${MAIN_ENTITY}Controller.java"

render_template "$TEMPLATES_DIR/03-Execucao/src/main/java/Application.java.tpl" \
                "$PROJECT_DIR/03-Execucao/src/main/java/$PACKAGE_PATH/${APPLICATION_NAME}Application.java"

render_template "$TEMPLATES_DIR/README.md.tpl" \
                "$PROJECT_DIR/README.md"

echo "✨ Orquestração concluída com sucesso para o projeto '$PROJECT_NAME'!"

# ==============================================================================
# 📘 GUIA DE MANUTENÇÃO E EXPANSÃO
# ==============================================================================
# O guia detalhado de manutenção (explicação das 3 seções do .cfg, como adicionar
# novos documentos, entidades Java, variáveis e regeneração) foi movido para o
# arquivo README.md localizado nesta mesma pasta:
#
# 👉 Consulte: ./README.md
# ==============================================================================
