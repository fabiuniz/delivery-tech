#!/bin/bash

# ==========================================
# Script de Inicialização Parametrizado com Proteção Total contra Sobrescrita
# Uso: ./MakeProject.sh [arquivo.cfg]
# ==========================================

# Se nenhum parâmetro for passado, usa 'projeto.cfg' como padrão
CONFIG_FILE="${1:-projeto.cfg}"

# Se o arquivo de configuração padrão não existir, cria um automaticamente
if [ ! -f "$CONFIG_FILE" ]; then
    echo "⚠️ Aviso: Arquivo '$CONFIG_FILE' não encontrado. Criando um arquivo padrão..."
    cat << 'EOF' > projeto.cfg
PROJECT_NAME="DeliveryTech"
PROJECT_DIR="delivery-tech-complete"
COURSE_NAME="Gestão de Projetos de TI (Qualifica São Paulo / Fundação FAT — Turma T9)"
PROJECT_CODE="QSP-GPTI-T9-FOOD"
PROJECT_MANAGER="Fabiano Rocha"
START_DATE="05/11/2026"
END_DATE="17/12/2026"
SERVER_PORT="8080"
EOF
    echo "✅ Arquivo 'projeto.cfg' gerado com sucesso!"
fi

echo "📖 Lendo as configurações de '$CONFIG_FILE'..."
source "$CONFIG_FILE"

echo "🚀 Garantindo a estrutura completa do projeto '$PROJECT_NAME' em '$PROJECT_DIR'..."

# Criando todas as pastas
mkdir -p "$PROJECT_DIR/01-Iniciacao"
mkdir -p "$PROJECT_DIR/02-Planejamento/Governanca"
mkdir -p "$PROJECT_DIR/02-Planejamento/Escopo"
mkdir -p "$PROJECT_DIR/02-Planejamento/Arquitetura-Tecnica"
mkdir -p "$PROJECT_DIR/02-Planejamento/Backlog-Sprints"
mkdir -p "$PROJECT_DIR/02-Planejamento/Riscos"
mkdir -p "$PROJECT_DIR/02-Planejamento/Stakeholders"

# Pastas do código-fonte em Java (Spring Boot - mantendo compatibilidade com os pacotes)
mkdir -p "$PROJECT_DIR/03-Execucao/src/main/java/com/deliverytech/controller"
mkdir -p "$PROJECT_DIR/03-Execucao/src/main/java/com/deliverytech/service"
mkdir -p "$PROJECT_DIR/03-Execucao/src/main/java/com/deliverytech/dao"
mkdir -p "$PROJECT_DIR/03-Execucao/src/main/java/com/deliverytech/model"
mkdir -p "$PROJECT_DIR/03-Execucao/src/main/java/com/foodexpress/controller"
mkdir -p "$PROJECT_DIR/03-Execucao/src/main/java/com/foodexpress/service"
mkdir -p "$PROJECT_DIR/03-Execucao/src/main/java/com/foodexpress/dao"
mkdir -p "$PROJECT_DIR/03-Execucao/src/main/java/com/foodexpress/model"
mkdir -p "$PROJECT_DIR/03-Execucao/src/main/resources"
mkdir -p "$PROJECT_DIR/03-Execucao/src/test/java/com/deliverytech"
mkdir -p "$PROJECT_DIR/03-Execucao/src/test/java/com/foodexpress"

echo "📂 Pastas verificadas/criadas com sucesso!"

cd "$PROJECT_DIR"

# ==========================================
# 1. DOCUMENTAÇÃO DE GESTÃO (Com Proteção Total)
# ==========================================

# 1. TAP
if [ ! -f "01-Iniciacao/Termo_Abertura_Projeto.md" ]; then
    cat << EOF > 01-Iniciacao/Termo_Abertura_Projeto.md
<!-- [Seq: 01] Documento Inicial -->
📄 TERMO DE ABERTURA DO PROJETO (TAP) — $PROJECT_NAME
**Curso:** $COURSE_NAME  
**Versão:** 1.0 | **Status:** Rascunho / Em aprovação  

## 1. Identificação do projeto
| Campo | Preenchimento |
| :--- | :--- |
| **Nome do projeto** | $PROJECT_NAME — Sistema de Delivery Inteligente |
| **Código** | $PROJECT_CODE |
| **Gerente do projeto** | $PROJECT_MANAGER |
| **Patrocinador** | Programa Qualifica SP / Fundação FAT |
| **Data de elaboração** | 09/11/2026 |
| **Previsão de início** | $START_DATE |
| **Previsão de término** | $END_DATE |

## 2. Contexto e justificativa
O crescimento do setor de delivery de alimentos exige soluções tecnológicas robustas e modernas. A $PROJECT_NAME visa oferecer uma alternativa eficiente e escalável para consumidores, restaurantes e entregadores, promovendo uma experiência fluida e confiável.

## 3. Objetivo do projeto
Desenvolver e implantar uma plataforma de delivery de comida funcional, segura e escalável, conectando restaurantes, clientes e entregadores em tempo real.  
**Objetivos Específicos:**
- Criar cadastro para restaurantes, clientes e entregadores
- Integrar sistema de pagamento seguro
- Implementar rastreamento de pedidos
- Permitir avaliação pós-entrega
- Proporcionar gestão de cardápio e pedidos

## 4. Escopo inicial
- **Dentro do escopo:** Módulo de login, cadastro de restaurantes/cardápios, tela de pedidos para cliente, tela de acompanhamento para entregador, área administrativa.
- **Fora do escopo:** Frota física própria de entregadores nesta primeira fase.

## 5. Principais entregas
| Entrega | Descrição | Critério de aceitação |
| :--- | :--- | :--- |
| **Entrega 1** | Modelagem de dados e arquitetura DAO com Spring Boot | Validação da persistência no banco relacional |
| **Entrega 2** | Endpoints RESTful para cadastro de cardápios e restaurantes | Validação de requisições interativas via Swagger |
| **Entrega 3** | Fluxo de pedidos e painel de acompanhamento do entregador | Atualização de status em tempo real |

## 6. Stakeholders
| Stakeholder | Papel | Interesse ou responsabilidade |
| :--- | :--- | :--- |
| **Primários** | Clientes, Restaurantes, Entregadores, CEO da $PROJECT_NAME | Uso direto da plataforma, gestão de negócios e liderança estratégica |
| **Secundários** | Equipe técnica, Investidores, Suporte, Parceiros de pagamento | Desenvolvimento, aporte financeiro, atendimento e transações |

## 7. Cronograma de alto nível (Macro das 16 Práticas)
| Marco / Prática | Data prevista |
| :--- | :--- |
| **Prática 0:** Iniciação do Projeto e Estruturação | Semana 1 |
| **Prática 1 a 4:** Arquitetura, Cadastro e Fluxo de Pedidos | Semanas 2 a 5 |
| **Prática 5 a 8:** Login, Pagamento e Rastreamento | Semanas 6 a 9 |
| **Prática 9 a 12:** Avaliações, Tela Admin e Testes | Semanas 10 a 13 |
| **Prática 13 a 16:** Ajustes, Deploy e Apresentação Final | Semanas 14 a 16 (Término em $END_DATE) |

## 8. Orçamento estimado
- **Orçamento autorizado ou estimado:** R$ 0,00 (Projeto Educacional / Qualifica SP)
- **Principais custos:** Dedicação da equipe (PO, SM, Devs), ferramentas (Spring Boot, Jira, GitHub) e infraestrutura.

## 9. Premissas e restrições
- **Premissas:** Infraestrutura estável e participação ativa da equipe multidisciplinar.
- **Restrições:** Cronograma rígido vinculado ao encerramento do curso em $END_DATE.

## 10. Riscos iniciais
| Risco | Probabilidade | Impacto | Estratégia / Resposta |
| :--- | :--- | :--- | :--- |
| **Atraso na entrega** | Alta | Médio | Planejamento ágil (Scrum) |
| **Falha na integração de pagamento** | Média | Alto | Testes antecipados |

## 11. Critérios de sucesso
- Conclusão do desenvolvimento da plataforma conectando clientes, restaurantes e entregadores com aderência às 16 práticas.

## 12. Autoridade do gerente do projeto
O gerente de projetos ($PROJECT_MANAGER) possui autoridade para coordenar o planejamento e monitorar a execução das Sprints.

## 13. Aprovação
| Responsável | Decisão | Data |
| :--- | :--- | :--- |
| **Patrocinador (Qualifica SP / FAT)** | Aprovado | 09/11/2026 |
| **Gerente do projeto ($PROJECT_MANAGER)** | Ciência | 09/11/2026 |
EOF
    echo "📄 Criado: Termo_Abertura_Projeto.md"
else
    echo "⏭️ Pulado: Termo_Abertura_Projeto.md (já existe)"
fi

# 2. Governança
if [ ! -f "02-Planejamento/Governanca/Encontro_04_Governanca_Scrum.md" ]; then
    cat << EOF > 02-Planejamento/Governanca/Encontro_04_Governanca_Scrum.md
<!-- [Seq: 02] Governança Ágil -->
# Encontro 04 - Governança Ágil e Estruturação do Scrum ($PROJECT_NAME)
**Gerente de Projetos:** $PROJECT_MANAGER  

## 🎯 1. Declaração de Visão do Produto (Product Vision)
> **Para** consumidores e pequenos restaurantes que buscam agilidade e taxas justas no setor de delivery,  
> **o** *$PROJECT_NAME* é uma plataforma digital de entrega inteligente  
> **que** conecta clientes, entregadores e restaurantes locais com transparência, pagamentos seguros e menor taxa de comissão do mercado.

---

## 👥 2. Papéis e Responsabilidades no Scrum (Scrum Team)
- **Product Owner (PO):** Ana Costa — Responsável por gerenciar o Product Backlog e priorizar funcionalidades.
- **Scrum Master (SM):** João Silva — Responsável por facilitar cerimônias ágeis e remover impedimentos.
- **Developers (Time de Desenvolvimento):** Carla, Pedro e Lucas — Construção e testes dos incrementos. *(Supervisão: $PROJECT_MANAGER)*

---

## 🤝 3. Team Charter (Acordos e Regras de Convivência)
- **Visão do Time:** Trabalho colaborativo contínuo para entregar valor real aos usuários da $PROJECT_NAME.
- **Valores Inegociáveis:** Transparência radical, respeito mútuo, foco na qualidade e melhoria contínua.
- **Canais Oficiais:** Slack/WhatsApp para comunicação diária; Jira como fonte única da verdade.

---

## 📅 4. Calendário de Cerimônias Scrum (Ritualística)
- **Sprint Planning:** Início de cada ciclo.
- **Daily Scrum:** Reunião diária de 15 minutos às 9h.
- **Sprint Review & Retrospective:** Fim de cada ciclo para demonstração e melhoria contínua.

# Encontro 04 - Atividade Prática: Fundamentos Ágeis e Implementação do Scrum Framework — Delivery-tech
**Gerente de Projetos:** Fabiano Rocha  

## 🚀 Estrutura e Funções do Scrum Team
- **Product Owner (PO):** Ana Costa — Gerencia o Product Backlog e prioriza o valor de negócio.
- **Scrum Master (SM):** João Silva — Facilita cerimônias e remove impedimentos.
- **Development Team (Equipe):** Carla, Pedro e Lucas — Desenvolvem e testam os incrementos. *(Supervisão: Fabiano Rocha)*

---

## 📋 Team Charter e Acordos de Trabalho
| Tema | Acordo Definido / Combinado |
| :--- | :--- |
| **Melhoria Contínua** | Revisaremos nossos acordos sempre que necessário durante a Sprint Retrospective. |
| **Daily Scrum** | Realizada diariamente, com duração máxima de 15 minutos, via Teams, às 9h. |
| **Jira** | Cada integrante manterá suas atividades e status devidamente atualizados. |
| **Impedimentos** | Comunicaremos bloqueios assim que forem identificados para rápida atuação. |
| **Colaboração** | Ajudaremos os colegas sempre que necessário para cumprir o objetivo da Sprint. |
| **Qualidade** | Não consideraremos uma funcionalidade concluída se não atender à Definition of Done. |

> **Nosso Compromisso:** Todos os integrantes concordam em respeitar os acordos estabelecidos e contribuir ativamente para um ambiente de trabalho colaborativo, transparente e focado em valor.

---

## 📅 Eventos Scrum (Ritualística e Regras Importantes)
| Evento | Quando | Objetivo |
| :--- | :--- | :--- |
| **Sprint Planning** | Primeiro dia da Sprint | Definir por que a Sprint é valiosa, o que será realizado e como o trabalho será feito. |
| **Daily Scrum** | Todos os dias úteis, às 9h (máx. 15 min) | Inspecionar o progresso em direção ao Sprint Goal e adaptar o plano diário. |
| **Sprint Review** | Último dia da Sprint, às 15h | Inspecionar os resultados com os stakeholders, demonstrar o software e discutir adaptações. |
| **Sprint Retrospective** | Após a Review | Inspecionar a forma de trabalho da equipe e planejar melhorias contínuas. |

### ⚠️ Regras Importantes de Governança
- A Sprint tem duração fixa de **1 (uma) semana**.
- A Daily Scrum dura no **máximo 15 minutos**.
- A Sprint Review não é apenas uma apresentação, mas também uma oportunidade crucial para obter feedback real.
- A Sprint seguinte começa imediatamente após o encerramento da anterior, garantindo fluxo contínuo.

EOF
    echo "📄 Criado: Encontro_04_Governanca_Scrum.md"
else
    echo "⏭️ Pulado: Encontro_04_Governanca_Scrum.md (já existe)"
fi

# 3. Escopo
if [ ! -f "02-Planejamento/Escopo/Escopo_Projeto.md" ]; then
    cat << EOF > 02-Planejamento/Escopo/Escopo_Projeto.md
<!-- [Seq: 03] Declaração de Escopo -->
# Declaração de Escopo do Projeto — $PROJECT_NAME
**Gerente:** $PROJECT_MANAGER

## 1. Escopo Detalhado (In-Scope)
- Módulo Cliente: Cadastro, login, listagem de restaurantes, carrinho e fechamento de pedido.
- Módulo Restaurante: Painel de aceite de pedidos e gestão de cardápio.
- Módulo Entregador: Visualização de rotas e alteração de status.
- Backend & API: Arquitetura em camadas (Model, DAO, Service, Controller) em Java Spring Boot com Swagger.

## 2. Fora do Escopo (Out-of-Scope)
- Frota física própria de entregadores nesta fase.
- Integração com gateways de pagamento de produção (simulação via API).
EOF
    echo "📄 Criado: Escopo_Projeto.md"
else
    echo "⏭️ Pulado: Escopo_Projeto.md (já existe)"
fi

# 4. Arquitetura Técnica
if [ ! -f "02-Planejamento/Arquitetura-Tecnica/Especificacao_Arquitetura.md" ]; then
    cat << EOF > 02-Planejamento/Arquitetura-Tecnica/Especificacao_Arquitetura.md
<!-- [Seq: 04] Arquitetura Técnica -->
# Especificação da Arquitetura Técnica — $PROJECT_NAME

## 1. Stack Tecnológica de Referência
- **Backend:** Java com **Spring Boot**
- **Persistência de Dados:** Padrão **DAO (Data Access Object) / Repositories** para separação de responsabilidades.
- **Banco de Dados:** H2 Database (desenvolvimento/testes) / PostgreSQL.
- **Documentação de API:** **Swagger / OpenAPI** para endpoints interativos.
EOF
    echo "📄 Criado: Especificacao_Arquitetura.md"
else
    echo "⏭️ Pulado: Especificacao_Arquitetura.md (já existe)"
fi

# 5. Product Backlog
if [ ! -f "02-Planejamento/Backlog-Sprints/Product_Backlog.md" ]; then
    cat << EOF > 02-Planejamento/Backlog-Sprints/Product_Backlog.md
<!-- [Seq: 05] Product Backlog -->
# Product Backlog e Sprints — $PROJECT_NAME

## Módulo 1: Início e Estrutura Técnica
- [x] Configuração de repositório e pastas ($PROJECT_MANAGER)
- [x] Modelagem inicial de dados (Model e DAO/Repository)

## Módulo 2: Construção da Aplicação e Integrações
- [x] Desenvolvimento de RESTful APIs (Controller e Service)
- [ ] Implementação de transações seguras e concorrência
- [ ] Documentação interativa via Swagger
EOF
    echo "📄 Criado: Product_Backlog.md"
else
    echo "⏭️ Pulado: Product_Backlog.md (já existe)"
fi

# 6. Riscos
if [ ! -f "02-Planejamento/Riscos/Registro_Riscos.md" ]; then
    cat << EOF > 02-Planejamento/Riscos/Registro_Riscos.md
<!-- [Seq: 06] Registro de Riscos -->
# Registro de Riscos — $PROJECT_NAME

| ID | Risco | Categoria | Impacto | Mitigação |
| :--- | :--- | :--- | :--- | :--- |
| **R01** | Inconsistência em pedidos simultâneos | Técnico | Alto | Aplicar transações seguras e DAO estruturado. |
| **R02** | Atrasos nas entregas parciais | Prazo | Alto | Gestão ágil e entregas incrementais por Sprint. |
EOF
    echo "📄 Criado: Registro_Riscos.md"
else
    echo "⏭️ Pulado: Registro_Riscos.md (já existe)"
fi

# 7. Stakeholders
if [ ! -f "02-Planejamento/Stakeholders/Registro_Stakeholders.md" ]; then
    cat << EOF > 02-Planejamento/Stakeholders/Registro_Stakeholders.md
<!-- [Seq: 07] Registro de Stakeholders -->
# Registro de Partes Interessadas — $PROJECT_NAME

| Papel | Nome / Grupo | Grau de Interesse | Expectativas |
| :--- | :--- | :--- | :--- |
| **Gerente de Projetos** | $PROJECT_MANAGER | Alto | Concluir com excelência e gerar valor de negócio. |
| **Patrocinador** | Qualifica SP / FAT | Alto | Cumprimento do cronograma e diretrizes pedagógicas. |
| **Usuários Finais** | Clientes, Restaurantes, Entregadores | Alto | Experiência fluida, transações seguras e agilidade. |
EOF
    echo "📄 Criado: Registro_Stakeholders.md"
else
    echo "⏭️ Pulado: Registro_Stakeholders.md (já existe)"
fi

# ==========================================
# 2. CÓDIGO-FONTE DA APLICAÇÃO (Com Proteção Total)
# ==========================================

if [ ! -f "03-Execucao/src/main/java/com/deliverytech/model/Pedido.java" ]; then
    cat << 'EOF' > 03-Execucao/src/main/java/com/deliverytech/model/Pedido.java
// [Seq: 08] Camada Model
package com.deliverytech.model;

import jakarta.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "tb_pedido")
public class Pedido {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String clienteNome;
    private String restauranteNome;
    private BigDecimal valorTotal;
    private String status = "CRIADO";

    public Pedido() {}
    public Long getId() { return id; }
    public String getClienteNome() { return clienteNome; }
    public String getRestauranteNome() { return restauranteNome; }
    public BigDecimal getValorTotal() { return valorTotal; }
    public String getStatus() { return status; }
}
EOF
    echo "☕ Criado: Pedido.java"
fi

if [ ! -f "03-Execucao/src/main/java/com/deliverytech/dao/PedidoRepository.java" ]; then
    cat << 'EOF' > 03-Execucao/src/main/java/com/deliverytech/dao/PedidoRepository.java
// [Seq: 09] Camada DAO
package com.deliverytech.dao;

import com.deliverytech.model.Pedido;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PedidoRepository extends JpaRepository<Pedido, Long> {}
EOF
    echo "☕ Criado: PedidoRepository.java"
fi

if [ ! -f "03-Execucao/src/main/java/com/deliverytech/service/PedidoService.java" ]; then
    cat << 'EOF' > 03-Execucao/src/main/java/com/deliverytech/service/PedidoService.java
// [Seq: 10] Camada Service
package com.deliverytech.service;

import com.deliverytech.dao.PedidoRepository;
import com.deliverytech.model.Pedido;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class PedidoService {
    private final PedidoRepository repository;
    public PedidoService(PedidoRepository repository) { this.repository = repository; }
    public Pedido criar(Pedido p) { return repository.save(p); }
    public List<Pedido> listar() { return repository.findAll(); }
}
EOF
    echo "☕ Criado: PedidoService.java"
fi

if [ ! -f "03-Execucao/src/main/java/com/deliverytech/controller/PedidoController.java" ]; then
    cat << 'EOF' > 03-Execucao/src/main/java/com/deliverytech/controller/PedidoController.java
// [Seq: 11] Camada Controller
package com.deliverytech.controller;

import com.deliverytech.model.Pedido;
import com.deliverytech.service.PedidoService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/pedidos")
public class PedidoController {
    private final PedidoService service;
    public PedidoController(PedidoService service) { this.service = service; }
    @PostMapping public ResponseEntity<Pedido> criar(@RequestBody Pedido p) { return ResponseEntity.status(201).body(service.criar(p)); }
    @GetMapping public ResponseEntity<List<Pedido>> listar() { return ResponseEntity.ok(service.listar()); }
}
EOF
    echo "☕ Criado: PedidoController.java"
fi

if [ ! -f "03-Execucao/src/main/resources/application.properties" ]; then
    cat << EOF > 03-Execucao/src/main/resources/application.properties
# [Seq: 12] Propriedades
server.port=$SERVER_PORT
spring.application.name=delivery-tech-api
spring.datasource.url=jdbc:h2:mem:deliverytechdb
spring.datasource.driverClassName=org.h2.Driver
spring.datasource.username=sa
spring.datasource.password=
spring.jpa.database-platform=org.hibernate.dialect.H2Dialect
spring.h2.console.enabled=true
EOF
    echo "⚙️ Criado: application.properties"
fi

if [ ! -f "README.md" ]; then
    cat << 'EOF' > README.md
<!-- [Seq: 13] README -->
# 🍔 DeliveryTech - Plataforma de Delivery Inteligente
**Gerente de Projeto:** Fabiano Rocha  
**Código:** QSP-GPTI-T9-FOOD  
Projeto estruturado via automação parametrizada com proteção total contra sobrescrita.
EOF
    echo "📄 Criado: README.md"
fi

cd ..

echo "✨ Execução concluída com sucesso para o projeto '$PROJECT_NAME'!"