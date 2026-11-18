#!/bin/bash
FOLDER_PROJECT="${1:-.}"
NAME_PROJECT="${1:-DeliveryTech}"

echo "🚀 Inicializando a specs ..."

# 1. Criando diretórios principais e camadas do projeto Spring Boot
mkdir -p $FOLDER_PROJECT/.ai-context

# Entrando na pasta raiz do projeto
cd $FOLDER_PROJECT

echo "📁 Criando arquivos de diretrizes e contexto para a IA (.ai-context/)..."

# 01-project-overview.md
cat << 'EOF' > .ai-context/01-project-overview.md
# $NAME_PROJECT - Visão Geral do Projeto

## Descrição
Plataforma inteligente de delivery de comida focada em alta performance, usabilidade e agilidade.

## Stack Tecnológica
- **Backend:** Java 17+ / Spring Boot
- **Banco de Dados:** MySQL
- **Build & Gerenciamento:** Maven
- **Versionamento:** Git + GitHub
- **Metodologia:** Scrum, Kanban, SAFe, DevOps (CI/CD com GitHub Actions)

## Objetivos do Projeto
- Criar um sistema escalável conectando clientes, restaurantes e entregadores em tempo real.
EOF

# 02-product-backlog.md
cat << 'EOF' > .ai-context/02-product-backlog.md
# $NAME_PROJECT - Product Backlog (MoSCoW)

## Must Have (MVP Core)
- **US001:** Cadastro e Perfil de Clientes
- **US002:** Login e Autenticação (JWT)
- **US003:** Cadastro de Restaurantes e Cardápios
- **US004:** Busca de Restaurantes e Pratos
- **US005:** Carrinho de Compras e Finalização de Pedido
- **US006:** Integração de Pagamento PIX

## Should Have (Growth)
- **US007:** Rastreamento de Entrega (Tracking em tempo real)
- **US008:** Painel do Entregador
- **US009:** Sistema de Avaliações e Feedbacks Pós-Entrega

## Could Have (Innovation)
- **US010:** Recomendações baseadas em IA / Histórico
EOF

# 03-current-sprint.md
cat << 'EOF' > .ai-context/03-current-sprint.md
# Status Atual da Sprint (Sprint 1)

- **Sprint Goal:** Concluir a infraestrutura base do Spring Boot e entregar o cadastro inicial de clientes.
- **Backlog Ativo:**
  - [x] US010 - Setup inicial do projeto Spring Boot e Banco de Dados (Concluído)
  - [ ] US001 - Cadastro de Clientes (Em andamento)
  - [ ] US002 - Login e Autenticação (A Fazer)
- **Impedimentos Ativos:** Nenhum no momento.
EOF

# 04-ai-system-prompt.md
cat << 'EOF' > .ai-context/04-ai-system-prompt.md
# Role & Persona: AI Technical Lead & Scrum Master
Você é a IA principal de engenharia e gestão de projetos responsável por desenvolver, manter e escalar o sistema **$NAME_PROJECT**.

## Suas Diretrizes Operacionais:
1. **Contexto Contínuo:** Sempre consulte os arquivos em `.ai-context/` antes de sugerir código ou mudanças de escopo.
2. **Abordagem Ágil:** Siga rigorosamente o framework Scrum, respeitando critérios de aceite (Given/When/Then) e a Definition of Done (DoD).
3. **Padrão de Resposta:** Sempre que o usuário perguntar "O que fazemos agora?", analise o `03-current-sprint.md`, indique a próxima User Story prioritária e forneça o passo a passo técnico (código, testes ou configuração) para executá-la.
EOF


cat << 'EOF' > .ai-context/04-ai-system-core.md
# SDE - T05433 - Gestão de Projetos de TI (Parte 1) -->
## 1. Visão Geral do Programa e Contexto Institucional
* **Realização:** Fundação FAT (entidade sem fins lucrativos focada em educação e tecnologia) em parceria com o Governo do Estado de São Paulo (SDE) através do programa **Qualifica SP**.
* **Objetivo do Programa:** Cursos profissionais e de empreendedorismo gratuitos, com certificado, visando conectar os concluintes a oportunidades no mercado de trabalho.
* **Corpo Docente:** 
  * **Professora Titular:** Carla Panegocci (Especialista em Gestão de Projetos, Scrum Master e Product Owner).
    * **Professores Convidados:** Prof. Ronaldo Barbosa (Unicamp/Ibmec), Profª. Patrícia, Prof. Fabio Xavier (CIO do TCESP) e Profª. Lucy Tabuti.
    * **Carga Horária e Prazos:**
  * **Carga Horária Total:** 120 horas divididas em 27 encontros (segunda a sexta-feira, das 18:30 às 22:30).
    * **Período:** De 05/11/2026 a 17/12/2026.
    * **Critério de Aprovação:** Frequência mínima de 75% (máximo de 7 faltas permitidas).
    ## 2. Acesso aos Ambientes e Suporte
  * **Ambiente Virtual de Aprendizagem (AVA):** [fat.estudar.life](https://fat.estudar.life/login/index.php)
  * **Login:** RA (sem pontos) ou e-mail pessoal cadastrado.
    * **Senha Inicial:** CPF (somente números) ou a senha provisória padrão (`123@Mudar`). Opção de recuperação/troca disponível via SMS/portal.
    * **Suporte Oficial:** Abertura de chamados em [fat.estudar.life/suporte](http://fat.estudar.life/suporte/) selecionando a categoria "Qualifica São Paulo". Para inconsistências de cadastro/acesso, utilize o formulário centralizador de ocorrências da turma.
  ## 3. Estrutura do Projeto Prático (Sistema de Delivery - $NAME_PROJECT)
O curso é 100% voltado à prática através do desenvolvimento guiado de uma startup fictícia de delivery, dividida em 4 módulos principais:
* **Módulo 1:** Introdução, proposta, arquitetura inicial, modelagem de banco de dados e primeira entrega ágil (Termo de Abertura do Projeto - TAP, Product Backlog, User Stories INVEST e Arquitetura/DAO).
* **Módulo 2:** Desenvolvimento de APIs RESTful, controle de concorrência, segurança, autenticação e documentação com Swagger.
* **Módulo 3:** Testes automatizados (JUnit/Mockito), deploy com CI/CD, escalabilidade e performance.
* **Módulo 4:** Integrações com serviços externos, monitoramento, logging, observabilidade, métricas ágeis (Lead Time, Cycle Time, WIP) e apresentação final.
## 4. Fundamentos de Gestão de Projetos (Iniciação e Escopo)
* **A Tripla Restrição:** Escopo, Tempo e Custo.
* **Perguntas Fundamentais para Estruturação:**
  1. *Por quê?* (Contexto e Justificativa / Dor do cliente).
    2. *O quê?* (Objetivos e Escopo da Entrega).
    3. *Quem?* (Partes Interessadas / Stakeholders).
    4. *Quando?* (Cronograma e Prazos).
    5. *Com quais recursos?* (Orçamento e Ferramentas).
    6. *Como avaliar?* (Critérios de Sucesso e Qualidade).
    * **Termo de Abertura de Projeto (TAP):** Alinhamento entre Contexto (o problema/dor), Justificativa (o valor gerado) e Objetivos (a entrega final).
  * **Gestão de Requisitos e Priorização:** 
  * Identificação de necessidades e condições das partes interessadas.
    * Técnicas de priorização de backlog (ex.: Método **MoSCoW**).

# SDE - T05433 - Gestão de Projetos de TI (Parte 2)-->
## 5. Arquitetura, Requisitos e Concepção de Sistemas (Jornada do Delivery)
* **Arquitetura de Alto Nível:** Organização das partes do sistema, comunicação e sustentação dos serviços (Frontend, API Gateway, Banco de Dados, Padrão DAO).
* **Mapeamento da Jornada do Usuário ($NAME_PROJECT):**
  * *Escolher o que comer:* Consultar restaurantes, cardápios e preços.
    * *Organizar a compra:* Adicionar e remover itens do carrinho.
    * *Informar onde receber:* Registrar e conferir o endereço de entrega.
    * *Confirmar a compra:* Conferir o total e selecionar a forma de pagamento (ex.: Pix, cartão).
    * *Preparar o pedido (Restaurante):* Receber, aceitar/recusar e atualizar o status.
    * *Realizar a entrega (Entregador):* Consultar retirada, destino e registrar conclusão.
    * *Acompanhar o andamento (Cliente):* Consulta de status em tempo real.
    ## 6. Abordagens de Desenvolvimento e MVP
  * **MVP (Mínimo Produto Viável):** Primeira versão utilizável contendo o estritamente necessário para entregar valor antecipado ao cliente e validar hipóteses.
* **Cascata vs. Ágil:** Discussão sobre abordagens preditivas/sequenciais versus entregas iterativas e incrementais.
* **Conceitos de Gestão e Processo:**
  * *Discovery:* Descobrir se estamos construindo a coisa certa.
    * *Delivery:* Construir a solução da maneira certa.
    * *Trabalho em Progresso (WIP):* Gestão de fluxo para evitar gargalos e excesso de tarefas simultâneas.
    ## 7. Ferramentas de Gestão e Documentação (Jira e Confluence)
  * **Configuração de Projetos no Jira:**
  * Criação de projetos utilizando o framework **Scrum**.
    * Estruturação de Épicos, Funcionalidades, Histórias de Usuário e Sprint Backlog.
    * **Documentação Colaborativa no Confluence:**
  * Criação de páginas para centralizar artefatos do projeto.
    * Utilização de templates estruturados (ex.: Termo de Abertura do Projeto - TAP e Visão do Produto).
    ## 8. Planejamento Ágil e Product Management
  * **Product Vision Statement (Declaração de Visão do Produto):**
  * *Para:* Pessoas que desejam pedir refeições de forma prática.
    * *Que precisam:* Encontrar restaurantes e realizar pedidos com facilidade.
    * *O $NAME_PROJECT é:* Um aplicativo de delivery de comida.
    * *Que oferece:* Escolha de restaurantes, cardápios, pedidos e acompanhamento.
    * *Diferente de:* Alternativas em que o cliente precisa negociar diretamente com cada restaurante.
    * *Nosso produto:* Reúne a experiência de pedido em um único aplicativo de forma simples e intuitiva.
    * **Product Vision Canvas:** Estruturação visual dividida em *Target Group* (Público-alvo), *Needs* (Necessidades), *Product* (Produto), *Business Goals* (Objetivos de Negócio) e *User Experience* (Experiência do Usuário).
  * **Roadmap Ágil:** Planejamento estratégico de horizontes temporais para evolução do produto (destino e caminho).
* **Escrita de Histórias de Usuário (User Stories):**
  * Estrutura padrão: **COMO** (persona) / **QUERO** (ação) / **PARA** (benefício).
    * Critérios de qualidade e refinamento baseados no acrônimo **INVEST** e técnicas auxiliares (como BDD/Gherkin).

# SDE - T05433 - Gestão de Projetos de TI (Parte 3)-->
## 9. Fundamentação Teórica e Institucional (Apostila e Encontros)
* **Missão, Visão e Valores (Fundação FAT):**
  * *Missão:* Estimular e desenvolver o conhecimento através de programas de geração, difusão e transferência de tecnologia.
    * *Visão:* Ser reconhecida como instituição ímpar, comprometida com a sociedade e com a excelência em todas as suas atividades.
    * *Valores:* Integridade, honestidade, respeito, responsabilidade social, transparência e aprendizagem contínua.
    * **Corpo Docente de Referência:**
  * Profª. Carla Panegocci (Gestão de Projetos, Scrum, PO e Dados).
    * Prof. Ronaldo Barbosa (Unicamp/Ibmec - Inovação e EAD).
    * Profª. Lucy Tabuti (POLI-USP/PUC-SP - Soft Skills e Liderança Disruptiva).
    * Prof. Fabio Xavier (TCESP - Transformação Digital, IA e LGPD).
    ## 10. Processos PMI e Ciclo de Vida do Projeto
  * **Definições Fundamentais:**
  * *Projeto:* Esforço temporário empreendido para criar um produto, serviço ou resultado único.
    * *Gestão de Projetos:* Aplicação de conhecimentos, habilidades, ferramentas e técnicas às atividades do projeto para atender aos seus requisitos.
    * **Os 5 Grupos de Processos (PMI):**
  1. **Iniciação:** Autorização formal e definição de escopo macro (ex.: TAP).
    2. **Planejamento:** Definição de cronogramas, custos, recursos, premissas, restrições e requisitos.
    3. **Execução:** Realização do trabalho definido no plano de gerenciamento (desenvolvimento das entregas).
    4. **Monitoramento e Controle:** Acompanhamento de desvios, métricas de fluxo, controle de prazos e gestão de riscos.
    5. **Encerramento:** Finalização formal de todas as atividades e entrega do produto final.
    * **Motivadores Estratégicos para Autorização de Projetos:** Demanda de mercado, oportunidade/necessidade estratégica, solicitação de cliente, avanço tecnológico e requisito legal.
  ## 11. Arquitetura de Software e Padrões de Projeto ($NAME_PROJECT)
* **Padrão DAO (Data Access Object):** Estratégia de implementação que isola a camada de acesso a dados das regras de negócio da aplicação.
* **Componentes e Microsserviços de um Sistema de E-commerce/Delivery:**
  * *Frontend:* Interface web/mobile de interação com o usuário.
    * *API Gateway:* Ponto de entrada único para roteamento de requisições e segurança.
    * *Microsserviços:* Módulos especializados por domínio de negócio.
    * *Banco de Dados e Mensageria:* Persistência relacional/não-relacional e comunicação assíncrona.
    ## 12. Engenharia de Requisitos e Práticas Ágeis
  * **Classificação de Requisitos:**
  * *Funcionais:* O que o sistema deve fazer (ex.: cadastrar cardápio, fazer login, adicionar ao carrinho).
    * *Não-Funcionais:* Como o sistema deve se comportar (ex.: performance, segurança, usabilidade).
    * **Escrita e Estruturação de User Stories (Histórias de Usuário):**
  * *Formato Padrão:* **COMO** [persona] / **QUERO** [ação necessária] / **PARA** [benefício/valor].
    * *Técnica BDD e Gherkin:* Padronização de comportamentos utilizando as clausulas **DADO QUE** (contexto inicial), **QUANDO** (ação executada) e **ENTÃO** (resultado esperado).
    * **Critérios de Qualidade (DoR e DoD):**
  * *DoR (Definition of Ready):* Critérios que determinam se uma história está pronta para entrar na Sprint.
    * *DoD (Definition of Done):* Critérios rigorosos que definem quando uma tarefa está 100% concluída e pronta para produção.

# SDE - T05433 - Gestão de Projetos de TI (Parte 4)-->
## 13. Visão Geral e Alinhamento do Framework Scrum
* **Definições Fundamentais:**
  * *Projeto:* Esforço temporário com início, meio e fim bem definidos, voltado à criação de um produto, serviço ou resultado único (conforme diretrizes do PMBOK e metodologias ágeis).
    * *Gestão de Projetos:* Planejamento e controle integrados para garantir a entrega de valor no prazo, com qualidade e dentro dos recursos disponíveis.
    * **Modelo Tradicional (Cascata) vs. Modelo Ágil:**
  * *Tradicional:* Sequencial, preditivo e rígido (requisitos coletados no início).
    * *Ágil:* Iterativo e incremental, dividido em ciclos curtos (Sprints) com foco em flexibilidade e adaptação rápida a mudanças.
    * **O Manifesto Ágil:**
  * **4 Valores:** Indivíduos e interações acima de processos e ferramentas; Software funcionando acima de documentação extensa; Colaboração com o cliente acima de negociação de contratos; Responder a mudanças acima de seguir um plano fixo.
    * **12 Princípios:** Focados em satisfação do cliente, entregas frequentes, simplicidade, colaboração e times auto-organizados.
    ## 14. Organização do Backlog e Arquitetura do Produto
  * **Product Backlog:**
  * Lista dinâmica e priorizada de itens do produto gerencia pelo Product Owner (PO). Representa o "O QUÊ" construir (focado em valor e requisitos).
  * **Hierarquia do Backlog (Épicos e User Stories):**
  * *Épicos:* Grandes temas ou caixas de funcionalidades (ex.: Gestão de Pedidos, Gestão de Usuários, Sistema de Pagamentos).
    * *User Stories (Histórias de Usuário):* Partes menores e gerenciáveis escritas no formato: `Como um [persona], eu quero [funcionalidade], para que [benefício/valor]`.
    * **Roadmap Ágil (Horizontes Temporais):**
  * *Fase 1 (MVP - 0 a 3 meses):* Core features (cadastro, cardápio, carrinho, pagamento, pedidos).
    * *Fase 2 (Crescimento - 3 a 6 meses):* Recomendações por IA, cashback, avaliações, login social.
    * *Fase 3 (Inovação e Escala - 6 a 12 meses):* Otimização de rotas, chat em tempo real, chatbot, relatórios avançados.
    ## 15. Critérios de Qualidade e Governança Ágil
  * **Critérios de Aceitação:** 
  * Condições objetivas e específicas que testam e validam se uma User Story atende às expectativas funcionais.
  * **Definition of Ready (DoR):** 
  * Conjunto de pré-requisitos que uma estória deve cumprir para estar apta a entrar em uma Sprint (estória bem escrita, com critérios de aceitação claros, estimada e fatiada).
  * **Definition of Done (DoD):** 
  * Critérios rigorosos que definem quando uma tarefa ou incremento está 100% concluído, testado e pronto para produção.
  * **Governança de Papeis e Acordos (Team Charter):**
  * Alinhamento de papis (PO, Scrum Master e Development Team), regras de convivência, canais de comunicação e valores compartilhados do time.
  ## 16. Planejamento de Sprints, Capacidade e Estimativas
  * **Sprint Planning:** Cerimônia de até 4 horas (para Sprints de 2 semanas) que responde o *O quê* entregar, *Como* fazer e *Quem* assume as tarefas, culminando no **Sprint Goal** (Objetivo da Sprint).
* **Capacity Planning:** Cálculo realista da disponibilidade de horas da equipe, descontando reuniões, feriados e impedimentos para mensurar a eficiência real de desenvolvimento.
* **Métrica de Velocity:** Histórico de capacidade de entrega da equipe medido em Story Points por Sprint.
* **Técnicas de Estimativa Relativa:**
  * *Story Points & Sequência de Fibonacci:* Avaliação de complexidade relativa considerando riscos, incertezas e esforço técnico.
    * *Planning Poker:* Estimativa colaborativa baseada em consenso por cartas.
    * *T-Shirt Sizing:* Dimensionamento rápido por tamanhos (XS, S, M, L) para o mapeamento inicial de escopo.

# SDE - T05433 - Gestão de Projetos de TI (Parte 5)-->
## 17. Seleção de Histórias para a Sprint e Planejamento Tático
* **Critérios para Seleção no Sprint Planning:**
  * Alinhamento com o *Sprint Goal* (Objetivo da Sprint).
    * Prioridade no Product Backlog e classificação **MoSCoW** (foco inicial nos itens *Must Have*).
    * Análise de dependências técnicas e limitação pela capacidade real da equipe (**Velocity** e **Capacity Planning**).
    * **Decomposição em Tarefas Técnicas (Tasks):**
  * Divisão das User Stories em atividades concretas orientadas à implementação (estimadas em horas, diferindo dos Story Points que medem valor/esforço relativo).
    * Exemplo prático: Quebra da estória de cadastro de usuário em telas responsivas, formulários, desenvolvimento de API, validação e testes de integração.
    * **Mapeamento de Dependências e Contingências:**
  * Identificação de pré-requisitos técnicos críticos (ex.: setup inicial de ambiente, infraestrutura ou pipelines CI/CD).
    * Criação de planos de contingência e gatilhos claros para redimensionamento de escopo caso surjam atrasos em tarefas essenciais ou ausências imprevistas de membros da equipe.
    ## 18. Execução, Acompanhamento e Métricas de Progresso
  * **Burndown Chart:**
  * Ferramenta visual de acompanhamento do trabalho restante (em Story Points ou horas) ao longo dos dias da Sprint.
    * Compara a linha de progresso ideal com a linha real, auxiliando na identificação precoce de desvios e garantindo transparência para a equipe e stakeholders.
    * **Cerimônias de Fechamento da Sprint:**
  * *Sprint Review:* Inspeção do incremento funcional com os *stakeholders*, validação das entregas e coleta de feedback.
    * *Sprint Retrospective:* Espaço de melhoria contínua focado em analisar o que deu certo, o que falhou (sem buscar culpados) e definir ações práticas para o próximo ciclo.
    ## 19. Product Management e Estruturação de Backlogs (Prática MVP $NAME_PROJECT)
  * **Conceito de Product Backlog:**
  * Lista viva, dinâmica e priorizada de requisitos, melhorias e correções gerencia exclusivamente pelo Product Owner (PO), servindo de base para o planejamento das entregas.
  * **Hierarquia Funcional:**
  * *Épicos:* Grandes blocos temáticos (ex.: Gestão de Restaurantes, Gestão de Pedidos, Sistema de Pagamentos, Logística de Entregas).
    * *User Stories:* Descrições focadas no valor do usuário utilizando o padrão `Como um [persona], eu quero [funcionalidade], para que [benefício]`.
    * **Critérios de Qualidade e Planejamento:**
  * *Critérios de Aceitação:* Validação comportamental baseada na estrutura *Given / When / Then* (Dado que / Quando / Então).
    * *Definição de Pronto (DoR):* Pré-requisitos para uma estória entrar na Sprint.
    * *Critérios INVEST:* Princípios para boas histórias (Independente, Negociável, Valiosa, Estimável, Pequena e Testável).
    * *Story Mapping e Matriz Valor vs. Esforo:* Técnicas visuais para mapear a jornada do cliente, priorizar entregas do MVP (*Must Have*) e classificar iniciativas por retorno sobre o investimento.
    ## 20. Execução Ágil: Daily Scrum e Gestão Visual
  * **Daily Scrum (Reunião Diária):**
  * Alinhamento rápido de até 15 minutos voltado a inspecionar o progresso rumo ao *Sprint Goal*.
    * Foco nas três perguntas fundamentais: o que foi feito ontem, o que será feito hoje e se há impedimentos.
    * **Gestão Visual e Kanban Board:**
  * Uso de quadros kanban para rastrear o fluxo de trabalho (Backlog, Em Andamento, Reviso, Teste, Concludo).
    * *WIP Limits (Limites de Trabalho em Progresso):* Restrições aplicadas para evitar multitasking, evidenciar gargalos e acelerar a conclusão real de tarefas.
    * *Impediment Register:* Controle de bloqueios ativos com definição de responsáveis e prazos de resolução.

# SDE - T05433 - Gestão de Projetos de TI (Parte 6)-->
## 21. Gestão Visual Avançada e Radiadores de Informação
* **Swimlanes (Divisões Horizontais no Quadro Kanban):**
  * Organização do trabalho por área técnica (Frontend, Backend, Infraestrutura), por prioridade (Urgente, Normal, Baixa) ou por segmento de negócio, facilitando a identificação de gargalos e desequilíbrios na distribuição de tarefas.
  * **Legendas e Sinalizações Visuais:**
  * Identificação de status críticos como *Urgente* (impacto direto no Sprint Goal), *Bloqueado* (impedimentos ativos que exigem atuação do Scrum Master), *Normal* e *Pair* (trabalho colaborativo).
  * **Radiadores de Informação (Information Radiators):**
  * Painéis visuais de comunicação passiva e constante (Burndown Charts, Dashboards de Sprint, Velocity Charts e Impediments Board) que garantem transparência total para a equipe e stakeholders, servindo de base para o Daily Scrum.
  ## 22. Métricas Ágeis e Indicadores de Desempenho
  * **Burndown Chart:** Relação diária entre o trabalho restante (em pontos ou horas) e o tempo total da Sprint, permitindo antecipar desvios e riscos de prazo.
* **Velocity Tracking:** Monitoramento histórico da quantidade de Story Points entregues por Sprint, servindo de base para o capacity planning e previsibilidade futura.
* **Capacity Utilization:** Comparação entre as horas planejadas e as reais trabalhadas, evitando sobrecarga (burnout) ou capacidade ociosa.
* **Métricas de Qualidade:** Acompanhamento de cobertura de testes automatizados, quantidade de bugs encontrados/resolvidos e tempo médio de code review.
## 23. Facilitação e Otimização do Daily Scrum
* **Boas Práticas e Postura:**
  * Cumprimento estrito do *timebox* (máximo de 15 minutos), foco no quadro Kanban e postura dinâmica (reuniões em pé ou em formato ágil remoto).
  * **Identificação de Sinais de Alerta (Coaching):**
  * Observação de sinais verbais e comportamentais de estresse, bloqueios ou desengajamento da equipe, utilizando perguntas abertas e estímulo ao pair programming.
  * **Armadilhas Comuns:**
  * Evitar transformar o Daily em um *Status Report* direcionado ao Scrum Master, reuniões excessivamente longas, ou falta de definição de ações concretas para os impedimentos.
  ## 24. Sprint Planning Prático (Encontro 08)
  * **Estruturação do Planejamento:**
  * Definição colaborativa do **Sprint Goal** (foco claro, mensurável e orientado a valor).
    * Execução do **Capacity Planning** (levantamento de horas disponíveis, aplicação de redutores e conversão para Story Points com base na capacidade real do time).
    * **Seleção de Histórias e Task Breakdown:**
  * Escolha de itens do Product Backlog alinhados às prioridades *Must Have* e à capacidade da equipe.
    * Decomposição das User Stories em **Tasks** técnicas estimadas em horas, detalhando o "como fazer" e mapeando dependências.
    * **Gestão de Riscos e Contingências:**
  * Identificação antecipada de riscos técnicos ou operacionais, definição de responsáveis, gatilhos (*triggers*) de acionamento e planos de contingência.
  ## 25. Sprint Review e Demonstração do Produto (Encontro 09)
  * **Conceito e Objetivos:**
  * Evento formal de inspeção e adaptação ao final da Sprint, reunindo a equipe e os *stakeholders* para demonstrar o valor gerado, coletar feedback em tempo real e reajustar o Product Backlog.
  * **Dinâmica da Demonstração (Storytelling):**
  * Utilização de personas reais (ex.: Maria, a analista de marketing no projeto $NAME_PROJECT) para guiar a apresentação do fluxo de valor (Cadastro, Login, Busca, Cardápio e Carrinho).
  * **Análise de Resultados e Transparência:**
  * Comparação entre o planejado e o realizado, apresentação de métricas de qualidade, burndown, velocity e coleta estruturada de feedback dos stakeholders para melhoria contínua.

# SDE - T05433 - Gestão de Projetos de TI (Parte 7)-->
## 26. Sprint Review: Coleta de Feedback e Matriz de Impacto vs. Esforço
* **Ferramentas de Coleta:**
  * Utilização de formulários estruturados (Google Forms), sistemas de votação para priorização, sessões abertas de perguntas/respostas e quadros digitais colaborativos (Miro).
  * **Matriz de Impacto x Esforço (Organização do Feedback):**
  * *Alto Impacto / Baixo Esforo:* Prioridade máxima para a próxima sprint (Quick Wins).
    * *Alto Impacto / Alto Esforo:* Necessitam de planejamento estratégico e fatiamento em partes menores.
    * *Baixo Impacto / Baixo Esforo:* Oportunidades pontuais de melhoria.
    * *Baixo Impacto / Alto Esforo:* Evitar ou postergar.
    * **Planejamento Pós-Review:** Atualização do Product Backlog com base no feedback, definição do novo Sprint Goal, refinamento das User Stories subsequentes, preparação de ambiente e agendamento da Retrospectiva.
  ## 27. Execução e Monitoramento Ágil: Daily Scrum e Gestão Visual (Encontro 10)
* **Facilitação do Daily Scrum (Simulação Prática):**
  * Condução da reunião estritamente dentro do *timebox* de 15 minutos, focando nas três perguntas fundamentais (o que fez, o que fará, impedimentos) e garantindo que o Scrum Master atue como facilitador e não condutor de status report.
  * **Otimização do Quadro Kanban:**
  * Implementação de colunas específicas para itens bloqueados (*BLOCKED*), aplicação rigorosa de **Limites de WIP** (ex.: Doing $\le 4$, Review $\le 2$, Testing $\le 3$) e uso de swimlanes por áreas técnicas ou legendas visuais (*Urgente*, *Bloqueado*, *Concluído*).
  * **Gestão de Impedimentos e Coaching Individual:**
  * Registro sistemático de bloqueios no *Impediment Register*, designação de responsáveis e prazos, além de aplicação de técnicas de coaching para membros da equipe que enfrentam sobrecarga ou insegurança tecnológica.
  * **Monitoramento por Métricas e Ajuste de Escopo:**
  * Acompanhamento do *Burndown Chart*, taxas de cobertura de testes (*Test Coverage*), taxa de bugs e status de *Code Review*.
    * Dinâmica de ajuste de escopo da Sprint (manter escopo, simplificar funcionalidades ou remover estórias não essenciais, como a US003 de Perfil) para proteger o *Sprint Goal*.
    ## 28. Sprint Retrospective e Melhoria Contínua (Encontro 11)
  * **Conceito e Objetivos:**
  * O último evento do ciclo Scrum focado em pessoas, interações, processos e ferramentas. Tem como propósito detectar impedimentos, promover aprendizado contínuo, celebrar conquistas e gerar planos de ação práticos.
  * **Princípios e Dinâmicas:**
  * Baseada na *Prime Directive do Scrum* (ausência de julgamentos pessoais e foco na melhoria de processos).
    * Principais táticas e frameworks: **Start / Stop / Continue**, **4Ls**, **Sailboat** (metfora nutica com ventos, âncoras, rochas e ilhas), **Glad / Sad / Mad** e Retrospectiva de Emojis.
    * **Estrutura da Reunião (5 Fases):**
  1. *Set the Stage* (Preparação do ambiente seguro).
    2. *Gather Data* (Coleta de fatos, burndowns e velocity).
    3. *Generate Insights* (Análise de causas-raiz).
    4. *Decide What to Do* (Seleção de até 3 melhorias prioritárias).
    5. *Close the Retrospective* (Fechamento e compromissos).
    * **Garantia de Resultados Reais:**
  * Limitação de escopo (máximo de 3 melhorias por sprint), atribuição clara de *ownership*, prazos definidos, integração das ações de melhoria ao backlog da próxima sprint e acompanhamento quinzenal ou diário.

# SDE - T05433 - Gestão de Projetos de TI (Parte 8)-->
## 29. Rituais Pós-Retrospectiva e Gestão de Experimentos de Melhoria
* **Acompanhamento Contínuo:**
  * *Check Semanal de Métricas:* Verificação rápida de indicadores-chave para monitoramento de tendências.
    * *Feedback Contínuo:* Canais abertos de observação sobre o impacto das mudanças na equipe.
    * *Reuniões de Revisão de Experimentos:* Sesses dedicadas a avaliar o andamento prático das melhorias adotadas (ex.: SLA de Code Review, Pair Programming e DoD Expandida).
    * **Critérios de Sucesso para Experimentos:**
  * *Continuar:* Se mais de 80% das metas forem atingidas, o experimento é incorporado aos processos padrão.
    * *Ajustar:* Resultados entre 60% e 79% exigem refinamentos incrementais.
    * *Parar e Repensar:* Menos de 60% resulta em descontinuação ou reformulação total.
    ## 30. Introdução aos Fundamentos do Kanban
  * **Origem e Conceito:**
  * Método visual de gerenciamento de trabalho originado no sistema de produção da Toyota (anos 1940), baseado em princípios Lean para maximizar a eficiência, reduzir desperdícios e otimizar o fluxo de forma evolutiva.
  * **Os 6 Princípios Fundamentais:**
  1. Visualizar o fluxo de trabalho.
    2. Limitar o trabalho em progresso (WIP).
    3. Gerenciar o fluxo.
    4. Tornar as políticas explícitas.
    5. Implementar ciclos de feedback.
    6. Melhorar colaborativamente.
    * **Value Stream Mapping (VSM):**
  * Mapeamento do fluxo de valor desde a concepção até a entrega, distinguindo atividades que agregam valor, atividades necessárias sem valor agregado e desperdícios.
  ## 31. Arquitetura do Quadro Kanban e Políticas de Fluxo
  * **Design Padrão de Colunas:**
  * *Backlog* $\rightarrow$ *Analysis* $\rightarrow$ *Ready for Dev* $\rightarrow$ *In Progress* $\rightarrow$ *Code Review* $\rightarrow$ *Testing* $\rightarrow$ *Ready for Deploy* $\rightarrow$ *Done*.
  * **Subcolunas e Granularidade:**
  * Divisão para rastreio refinado (ex.: *Code Review Waiting*, *In Review*, *Changes*), permitindo identificar gargalos específicos e aplicar limites de WIP precisos.
  * **Políticas de Fluxo e SLAs:**
  * Regras explícitas e contratos acordados pela equipe (DoD, DoR, regras de priorização e tempos máximos de resposta/SLA por etapa).
  ## 32. Métricas de Fluxo, Desempenho e Qualidade
  * **WIP Limits e Lei de Little:**
  * Prática de restringir o número de itens simultâneos para evitar multitasking, sobrecarga e perda de produtividade, relacionada matematicamente pela fórmula: $\text{WIP} = \text{Throughput} \times \text{Lead Time}$.
  * **Classes de Serviço:**
  * Categorização de demandas por urgência e impacto: *Expedite* (máxima prioridade/interrupção), *Fixed Date* (prazo fixo), *Standard* (fluxo normal) e *Intangible* (melhorias/refatorações).
  * **Lead Time vs. Cycle Time:**
  * *Lead Time:* Perspectiva do cliente (do pedido até a entrega final).
    * *Cycle Time:* Perspetiva interna da equipe (início ativo do desenvolvimento até a conclusão).
    * **Throughput e Velocity:**
  * *Throughput:* Quantidade de itens concluídos por unidade de tempo (focado em dados reais).
    * *Velocity:* Pontos de história entregues por sprint (herança do Scrum).
    * **Ferramentas Analíticas Avançadas:**
  * *Cumulative Flow Diagram (CFD):* Gráfico empilhado temporal para análise de estabilidade, WIP e gargalos.
    * *Aging Chart:* Acompanhamento da idade individual dos itens no sistema com uso de limites (*thresholds*) e alertas.
    * *Simulação de Monte Carlo:* Estatística histórica para previsão de cenários de entrega com percentis de confiança (50%, 85%, 95%).

# SDE - T05433 - Gestão de Projetos de TI (Parte 9)-->
## 33. Governança de Fluxo e Rituais Periódicos no Kanban
* **Estrutura de Governança por Níveis:**
  * *Daily (Foco Operacional):* Diária (15 min) com a equipe completa para monitoramento de WIP, aging, remoção de impedimentos imediatos, alertas de SLA e rebalanceamento diário.
    * *Weekly Review (Foco Tático):* Semanal (30-60 min) com a equipe e PO para análise de métricas de fluxo (Lead Time, Throughput), ajustes de WIP, replanejamento de curto prazo e revisão de bloqueios recorrentes.
    * *Monthly Review (Foco Estratégico):* Mensal (1-2h) com equipe, liderança e stakeholders para análise de tendências de longo prazo, avaliação de experimentos, ajustes estruturais e alinhamento com objetivos estratégicos.
    * **Pilares da Governança Eficaz:** Disciplina na execução das reuniões, tomada de decisão baseada em dados objetivos, transparência total, mentalidade experimental e documentação rigorosa.
  ## 34. Rotina de Otimização Contínua e Ciclo PDCA Aplicado
* **Ciclo de Otimização do Fluxo:**
  1. *Identificar Oportunidades:* Detecção de gargalos e variabilidades via métricas.
    2. *Formular Hipóteses:* Formulação de teorias testáveis com indicadores claros.
    3. *Conduzir Experimentos:* Implementação controlada de mudanças por tempo determinado.
    4. *Avaliar Resultados:* Comparação de dados antes e depois da intervenção.
    5. *Decidir Prximos Passos:* Adotar permanentemente, ajustar/retentar ou abandonar o experimento.
    * **Roadmap de Melhorias:** Priorização de iniciativas por impacto, sequenciamento para minimizar perturbações e alinhamento estratégico.
  ## 35. Aplicações Avançadas e Cenários Ideais para o Kanban
* **Contextos de Utilização:**
  * *Desenvolvimento de Software:* Visualização de features, balanceamento de bugs e simulações Monte Carlo.
    * *Marketing, Design e Criacio:* Gestão de campanhas, produção de conteúdo e prazos criativos.
    * *Departamentos Jurídicos e Administrativos:* Controle de contratos, processos de compras, onboarding e compliance.
    * **Cenários Críticos que se Beneficiam do Kanban:** Alto volume de tarefas contínuas, excesso de bugs e retrabalho, e falta de previsibilidade/visibilidade das entregas ("trabalho invisível").
  ## 36. Configuração de Boards Avançados e Automação (Jira)
* **Customizações de Fluxo:**
  * Mapeamento do Value Stream com colunas e subcolunas detalhadas (ex.: *Code Review* dividido em *Waiting*, *In Review* e *Changes Requested*).
    * Aplicação visual de **Classes de Serviço** via cores e swimlanes (*Expedite*, *Fixed Date*, *Standard*, *Intangible*).
    * **Medição Automática:**
  * Coleta em tempo real de Lead/Cycle Time (*Control Charts* e percentis 50/85/95), gráficos de *Aging*, *Throughput* semanal, *Cumulative Flow Diagram (CFD)* e alertas automáticos de violação de SLA.
  ## 37. Resolução de Casos Práticos e Métricas Executivas
  * **Exemplo 1: Gargalo em Code Review:**
  * Identificação de PRs estagnados por dias. Solução: SLA de 24h, alertas visuais, políticas de parada de linha (*Stop the Line*), dias dedicados a revisões e limite de linhas por PR. Resultado: Redução expressiva no Lead Time e no retrabalho.
  * **Exemplo 2: Testing Flutuante:**
  * Dependência de um único QA. Solução: *Cross-training* (capacitação cruzada de desenvolvedores), pareamento inicial e rotinas de testes compartilhadas. Resultado: Redução de 65% no tempo de espera e aumento de capacidade.
  * **Dashboard Executivo:** Tradução de métricas técnicas para CTO (tendências e qualidade), CEO (previsibilidade e capacidade) e PO (progresso de features e impedimentos).
  ## 38. Prática da Sprint Review e Demonstração do Produto (Encontro 14)
* **Dinâmica e Estrutura (60 min):**
  * Abertura/Contexto (5-10 min), Planejado vs. Entregue (10 min), Demonstração em ambiente real com storytelling e personas (ex.: Maria pedindo sushi) (20-25 min), Coleta de Feedback (10 min) e Roadmap (5 min).
  * **Papéis e Ferramentas:** Atuação do Scrum Master como facilitador, desenvolvedores na demonstração, registro estruturado de feedback via formulários e atualização imediata do Product Backlog e Roadmap no Jira com base na *Matriz Impacto x Esforço*.
  ## 39. Introdução ao Scaled Agile Framework (SAFe)
* **Conceito e Necessidade de Escala:**
  * Framework para alinhar múltiplos times em grandes organizações, superando os desafios de silos, prioridades conflitantes e falta de visibilidade em roadmaps corporativos.
  * **Os 4 Níveis do SAFe:**
  1. *Team* (Equipes Scrum/Kanban).
    2. *Program* (Agile Release Train - ART).
    3. *Large Solution* (Coordenação de grandes soluções).
    4. *Portfolio* (Alinhamento com a estratégia empresarial).
    * **Papeis e Eventos Principais:**
  * *Papeis:* Release Train Engineer (RTE), Product Manager, System Architect e Business Owners.
    * *Eventos:* Program Increment (PI) Planning (planejamento de 8-12 semanas), Scrum of Scrums, PO Sync, System Demo e eventos de Inspeção & Adaptação (I&A).

# SDE - T05433 - Gestão de Projetos de TI (Parte 10)-->
## 40. Scaled Agile Framework (SAFe): Inspecão, Adaptação e Práticas em Escala
* **Inspect & Adapt (I&A):**
  * Evento de encerramento do *Program Increment* (PI) composto por três partes: Demonstração do PI (entregas completas para stakeholders), Avaliação Quantitativa (análise de métricas e previsibilidade) e Workshop de Melhoria (análise de causas-raiz e planos de ação).
  * **Métricas Principais no SAFe:**
  * *Velocity por Equipe:* Capacidade de entrega medida em Story Points por sprint.
    * *Taxa de Dependências:* Porcentagem de dependências entre equipes resolvidas no prazo.
    * *Predictability Measure:* Percentual de objetivos do PI alcançados em relação ao planejado (meta $>80\%$).
    * **Cultura e Desafios de Adoção:**
  * *Elementos Culturais:* Colaboração intensiva, transparência radical, visão unificada, aprendizado contínuo, alinhamento estratégico e liderança servil.
    * *Desafios:* Complexidade de adoção, curva de aprendizado acentuada e resistência cultural à mudança de mindset.
    ## 41. Aplicação Prática do SAFe (Case $NAME_PROJECT)
  * **Estrutura do Case ($NAME_PROJECT):**
  * 5 equipes Scrum organizadas em 1 único *Agile Release Train* (ART): Mobile, Web, Backend, Dados e Infraestrutura.
    * Atuação dos papis: RTE (Release Train Engineer), Product Manager, System Architect e Business Owners.
    * **Sincronização de PI e Gestão de Dependências:**
  * Organização do PI em Sprints sincronizadas (ex.: Sprints 1-2 focadas em APIs e microsserviços, Sprints 3-4 em integração e staging, Sprint 5 em finalização).
    * Gestão ativa de dependências cruzadas entre Mobile, Web, Dados e Infraestrutura por meio de ferramentas como Jira, Miro e Confluence.
    ## 42. Sprint Retrospective Aplicada (Encontro 16)
  * **Objetivos e Dinâmica:**
  * Reflexão coletiva baseada na *Prime Directive do Scrum* (segurança psicológica, sem atribuição de culpa).
    * Utilização da tática **Start / Stop / Continue** combinada com Silent Brainstorming, Dot Voting e a técnica dos **5 Porquês** para encontrar causas-raiz de problemas (ex.: code reviews lentos, estimativas imprecisas e falhas de comunicação entre squads).
    * **Plano de Ação e Experimentos:**
  * Transformação de insights em User Stories de melhoria e definição de experimentos (ex.: estabelecimento de SLA de 24h para Code Review com hipóteses, métricas de sucesso e duração determinada de 2 sprints).
    * Atualização da *Definition of Done (DoD)* expandida e acompanhamento semanal via dashboards de melhoria contínua.
    ## 43. Introdução ao DevOps e Cultura de Engenharia (Encontro 17)
  * **Conceito e Objetivos:**
  * Integração entre desenvolvimento (Dev) e operações (Ops) com foco em colaboração, automação, entrega contínua e feedback rápido.
    * *Principais Objetivos:* Reduzir o Lead Time, aumentar a frequência de deploys, diminuir a taxa de falhas em produção e acelerar o tempo de recuperação (MTTR).
    * **Princípios e Cultura:**
  * Foco em times multifuncionais, mentalidade de produto, responsabilidade compartilhada pela qualidade e transparência radical.
  * **Pipeline de CI/CD e Infraestrutura como Código (IaC):**
  * *Fases do Pipeline:* Build, Test, Qualidade (ex.: SonarQube), Deploy e Monitoramento.
    * *Infraestrutura como Código:* Provisionamento automatizado e versionado com ferramentas como Terraform, Ansible, Docker e orquestração via Kubernetes.
    * **Segurança Integrada (DevSecOps) e Observabilidade:**
  * Scans automáticos de vulnerabilidades, análises estáticas e centralização de logs e métricas em tempo real (Prometheus, Grafana, ELK Stack).
  * **Métricas DORA:**
  1. *Deployment Frequency* (Frequência de Deploy).
    2. *Lead Time for Changes* (Tempo do commit até produção).
    3. *Change Failure Rate* (Taxa de falha em mudanças).
    4. *Time to Recovery* (Tempo para recuperação de falhas).

# SDE - T05433 - Gestão de Projetos de TI (Parte 11)-->
## 44. Ferramentas, Pipelines e Práticas Avançadas de CI/CD
* **Ferramentas de Mercado:**
  * *GitHub Actions:* Integração nativa baseada em arquivos YAML.
    * *Jenkins:* Servidor de automação altamente configurável.
    * *GitLab CI/CD:* Solução integrada com *runners* autogerenciados.
    * *Azure DevOps:* Plataforma corporativa completa da Microsoft.
    * **Arquitetura de Pipeline e Automação:**
  * *Exemplo de Pipeline CI:* Trigger no push $\rightarrow$ Checkout do código $\rightarrow$ Instalação de dependências (`npm install`) $\rightarrow$ Execução de suítes de testes automatizados (`npm test`).
    * *Deploy com Docker e Kubernetes:* Construção de imagens e publicação em registry $\rightarrow$ Aplicação de manifestos no cluster (`kubectl apply`) $\rightarrow$ Coleta de métricas e alertas via Prometheus e Grafana.
    * **Métricas DORA e Value Stream Mapping (VSM):**
  * Identificação de gargalos, medição do tempo agregado vs. tempo de espera, e correlação positiva entre alta frequência de deploys, menor *Lead Time* e menor taxa de falhas em produção.
  ## 45. Kanban Avançado e Métricas de Fluxo (Encontro 18)
  * **Diagnóstico de Problemas Típicos:**
  * Estagnação em Code Review, sobrecarga desigual de tarefas, bugs detectados tardiamente em produção e baixa visibilidade dos gargalos operacionais.
  * **Estruturação do Sistema Kanban Avançado:**
  * Mapeamento do Value Stream (Análise $\rightarrow$ Desenvolvimento $\rightarrow$ Code Review $\rightarrow$ Testes $\rightarrow$ Deploy).
    * Aplicação de **Limites de WIP Dinâmicos** baseados na *Lei de Little* ($\text{WIP} = \text{Throughput} \times \text{Lead Time}$).
    * Configuração de **Classes de Serviço**: *Expedite* (crítico/2 dias), *Fixed Date* (prazo fixo), *Standard* (fluxo normal) e *Intangible* (melhorias táticas).
    * **Ferramentas Analíticas Avançadas:**
  * *Lead Time vs. Cycle Time:* Distância entre a perspectiva do cliente e a eficiência interna de execução.
    * *Throughput:* Volume de itens concluídos por semana (base empírica).
    * *Cumulative Flow Diagram (CFD):* Bandas empilhadas para detecção de inchaços e gargalos.
    * *Aging Chart:* Idade individual dos cards no board com limites (*thresholds*) e alertas de risco.
    * *Simulação de Monte Carlo:* Previsões probabilísticas de entrega baseadas em dados históricos (percentis de confiança de 50%, 85% e 95%).
    ## 46. Governança e Rituais do Kanban
  * **Estrutura de Acompanhamento:**
  * *Daily Kanban:* 15 minutos focados no fluxo, bloqueios e itens críticos.
    * *Weekly Metrics Review:* 30 a 60 minutos para análise de *throughput*, lead time e ajustes de WIP.
    * *Monthly Optimization:* Reunião estratégica de 1 a 2 horas para revisão profunda do sistema e refinamento de experimentos.
    ## 47. Gestão de Stakeholders e Comunicação em Projetos Ágeis (Encontro 19)
  * **Identificação e Mapeamento:**
  * Categorização em *Primários*, *Secundários*, *De Contexto* e *Influenciadores*.
    * Utilização da **Matriz Poder x Interesse** para planejar o nível de engajamento (Manter Satisfeito, Envolver Ativamente, Manter Informado e Monitorar).
    * **Estratégia e Planos de Comunicação:**
  * Definição clara de *Quem comunica*, *Para quem*, *O quê*, *Como*, *Quando* e *Por qual canal* (Slack, Radiadores de Informação, Confluence, Dashboards).
    * Personalização do conteúdo conforme o perfil (ex.: Dashboards executivos para o CEO, release notes para usuários, métricas de sprint para o time técnico).
    * **Gestão de Expectativas e Narrativa:**
  * Uso de *storytelling* estratégico para conectar objetivos de negócio a entregas técnicas, condução de rituais ágeis (Reviews, check-ins semanais, retrospectivas) e estabelecimento rigoroso de *Working Agreements* e acordos de nível de serviço (SLAs).

# SDE - T05433 - Gestão de Projetos de TI (Parte 12)-->
## 48. Gestão de Stakeholders em Cenários Críticos e Produtos B2B (Encontro 20)
* **Aplicações Especializadas:**
  * *Sistemas de Missão Crítica:* Alinhamento rigoroso entre equipes técnicas, usuários e gestores de risco.
    * *Produtos B2B com Ciclo Longo:* Gerenciamento prolongado de expectativas em implementações complexas e multifásicas.
    * *Comunicação em Produtos Digitais:* Equilíbrio entre expectativas técnicas e de marketing em releases frequentes, manutenções de feedback com o usuário final e prevenção de sobrecarga informacional.
    * **Ferramentas e Rituais de Engajamento:**
  * *Expectation Canvas:* Workshop estruturado para capturar expectativas de stakeholders, agrupar por temas e transformá-las em um contrato psicológico comum.
    * *Communication Charter:* Publicação de regras, frequências, formatos e responsabilidades de comunicação no Confluence.
    * *Surveys e NPS In-App:* Coleta contínua de feedback quantitativo e qualitativo para ajustes em tempo real.
    ## 49. Coordenação Ágil em Escala com Múltiplas Equipes (Prática SAFe)
  * **Simulação de PI Planning para a $NAME_PROJECT:**
  * Organização de 5 equipes Scrum (Mobile, Web, Backend, Dados e Infraestrutura) em um único Agile Release Train (ART) para um Program Increment de 10 semanas (5 sprints).
  * **Estrutura de Coordenação e Alinhamento:**
  * *Papeis Chave:* Release Train Engineer (RTE), Product Manager, System Architect e Business Owners.
    * *Eventos e Sincronização:* Realização do PI Planning de 2 dias, Scrum of Scrums (2x por semana), PO Sync (semanal), Architect Sync, System Demo integrada e cerimônias de Inspect & Adapt (I&A).
    * **Gestão de Dependências e Riscos em Escala:**
  * Mapeamento visual no *Program Board* (Miro/Jira), rastreamento por criticidade e mitigação proativa de riscos técnicos (ex.: dependência de gateways de pagamento externos, picos de infraestrutura e legados).
  ## 50. Gestão de Riscos e Incertezas em Projetos Ágeis (Encontro 21)
  * **Diferenciação Conceitual:**
  * *Risco:* Evento incerto, mensurável, com probabilidade e impacto estimados via dados históricos.
    * *Incerteza:* Evento desconhecido e não quantificado, tratado no ágil por meio de ciclos iterativos, feedback constante e validação de hipóteses.
    * **Técnicas Ágeis de Identificação e Análise:**
  * *Risk Storming:* Brainstorming colaborativo multidisciplinar para descobrir riscos técnicos, de negócio e operacionais.
    * *Assumption Mapping:* Mapeamento de premissas não validadas cruzando evidência versus importância para gerar experimentos.
    * *Pre-Mortem Analysis:* Simulação retroativa de fracasso do projeto após 6 meses para identificar pontos cegos e falhas catastróficas.
    * **Estratégias de Resposta e Monitoramento Contínuo:**
  * *Matrizes e Priorização:* Classificação por exposição (Impacto $\times$ Probabilidade) e estratégias de resposta (**Avoid**, **Mitigate**, **Transfer**, **Accept**, **Exploit**).
    * *Risk-Driven Development:* Priorização do backlog focada em mitigar riscos técnicos e incertezas críticas antes de escalar o desenvolvimento.
    * *Ferramentas de Acompanhamento:* *Risk Register*, *Checkpoints/Triggers* para acionamento de planos de contingência, *Early Warnings* (KPIs com thresholds), *Risk Burndown Chart* e simulações de Monte Carlo para previsibilidade probabilística.

# SDE - T05433 - Gestão de Projetos de TI (Parte 13)-->
## 51. Gestão de Riscos Avançada e Cultura de Aprendizado (Encontro 22)
* **Risk Metrics e Indicadores de Acompanhamento:**
  * *Risk Exposure Total:* Soma ponderada de todos os riscos ativos (impacto $\times$ probabilidade) medida a cada sprint.
    * *Top Riscos:* Lista dos cinco maiores riscos monitorados e reportados ativamente.
    * *Taxa de Mitigação:* Razão entre riscos mitigados e novos riscos identificados.
    * *Efetividade:* Percentual de ações de mitigação que atingiram o resultado esperado.
    * **Integração com Rituais Ágeis e Critérios de Qualidade:**
  * *Planning:* Análise de riscos por história e definição de *spikes*.
    * *Daily:* Identificação de novos riscos e impedimentos emergentes.
    * *Review:* Avaliação de estratégias de mitigação aplicadas.
    * *Retrospectiva:* Análise de riscos materializados e lições aprendidas.
    * *DoR e DoD Expandidos:* Inclusão de critérios de risco (dependências mapeadas, planos de contingência, procedimentos de rollback e *fallback*).
    * **Cultura Sem Culpa:** Documentação sistemática de falhas como oportunidades de aprendizado, análise de causas-raiz focada em processos e celebração da identificação precoce de problemas.
  ## 52. DevOps e Integração Contínua na Prática (Case $NAME_PROJECT)
* **Value Stream Mapping (VSM) Aplicado:**
  * Mapeamento do fluxo de desenvolvimento até produção, identificação de desperdícios (testes e deploys manuais) e projeção de melhorias (redução do lead time de 12,5 dias para 6 dias, aumentando a eficiência de 40% para 70%).
  * **Arquitetura de Pipeline CI/CD:**
  * *CI (Continuous Integration):* Git-flow, build automatizado (Maven/NPM), suítes de testes em múltiplas camadas (unitários, integração, end-to-end) e *Quality Gates* via SonarQube.
    * *CD (Continuous Delivery/Deployment):* Ambientes progressivos (dev $\rightarrow$ staging $\rightarrow$ prod), estratégias de deploy seguro (*Blue-Green* e *Feature Flags*), mecanismos automáticos de *Rollback* e observabilidade via Prometheus e Grafana.
    * **Métricas DORA e Rituais:**
  * Acompanhamento rigoroso de *Deployment Frequency*, *Lead Time for Changes*, *Change Failure Rate* e *Time to Recovery* (MTTR), além da condução de *Post-Mortems* simulados e dailies conjuntas entre Dev e Ops.
  ## 53. Liderança Ágil e Cultura Organizacional (Encontro 23)
  * **Fundamentos e Mudança de Paradigma:**
  * Substituição do modelo tradicional de comando-controle por liderança servil, empoderamento de equipes auto-organizadas, confiança e transparência radical.
  * **Papéis e Atributos do Lider Ágil:**
  * Atuação multifacetada como *Coach*, *Facilitador*, *Mentor*, *Escudo da Equipe* e *Integrador*.
    * Equilíbrio delicado entre **Autonomia** e **Alinhamento** (evitando caos e microgerenciamento) e o uso de ferramentas como o *Delegation Poker* (Management 3.0) para gradação de autonomia.
    * **Práticas de Comunicação e Desenvolvimento:**
  * *Radical Candor (Kim Scott):* Combinação de empatia genuína e desafio direto no *feedback*.
    * *Gestão por Propósito:* Comunicação clara do "O quê", "Para quem", "Por quê" e do impacto mensurável de cada entrega.
    * *Ambientes Híbridos e Remotos:* Manutenção do engajamento, segurança psicológica e previsibilidade em equipes distribuídas.

# SDE - T05433 - Gestão de Projetos de TI (Parte 14)-->
## 54. Aprofundamento em Liderança Ágil e Transformação Cultural (Encontro 24)
* **Mudança de Paradigma na Gestão:**
  * *Da Execução para a Inovação:* Foco em novos conceitos em detrimento de processos meramente burocráticos.
    * *Do Controle para a Confiança:* Substituição de sistemas rígidos por autonomia responsável.
    * *Do Silo para a Colaboração:* Quebra de barreiras departamentais com times multidisciplinares.
    * **Aplicações Setoriais da Liderança Ágil:**
  * *RH Estratégico:* Foco em cultura organizacional, capacitação contínua, onboarding experiencial e avaliações 360°.
    * *Educação Corporativa:* Aprendizado contínuo, mentoria e autoaprendizagem.
    * *Marketing e Vendas:* Alinhamento com squads de growth, ciclos curtos de experimentos, métricas em tempo real e foco em resultados.
    * **Ferramentas Práticas de Apoio ao Líder:**
  * *Jira:* Gestão visual de impedimentos e progresso das squads.
    * *Miro (Team Canvas):* Co-construção de propósito, valores, papéis e normas operacionais.
    * *EasyRetro:* Retrospectivas focadas em avaliar o apoio e a escuta da liderança.
    * *Delegation Poker (Management 3.0):* Nivelamento de autonomia e clareza de quem decide o quê (níveis de 1 a 7).
    * *Radar de Maturidade:* Avaliação contínua entre pares focada em comunicação, visão, escuta, empatia e autonomia.
    ## 55. Refinamento do Backlog (Backlog Grooming) (Encontro 25)
  * **Conceito e Objetivos:**
  * Atividade contínua de revisão, detalhamento e priorização dos itens do backlog para garantir que estejam prontos (*Ready*) para a implementação. Reduz retrabalho e melhora a previsibilidade.
  * **Participantes e Dinâmica:**
  * *Product Owner (PO):* Esclarece requisitos de negócio, prioridades e critérios de aceitação.
    * *Time de Desenvolvimento:* Analisa viabilidade técnica, identifica dependências e estima esforço.
    * *Scrum Master (SM):* Facilita a sessão e garante a eficácia do processo.
    * *Frequência:* 1 a 2 vezes por sprint (cerca de 10% da capacidade do time).
    * **Critérios de Qualidade e Boas Práticas:**
  * *Critérios INVEST:* Independente, Testável, Sucinta, Negociável, Valor agregado, Estimável.
    * *Acrônimo DEEP:* Detalhado conforme necessário, Estimado, Emergente, Priorizado.
    * *Critérios de Aceitação:* Estruturados no formato *Dado que / Quando / Então*.
    * *Técnicas de Estimativa:* Planning Poker (sequência de Fibonacci) e T-Shirt Size (P, M, G, GG).
    * *Divisão de Histórias (Epics):* Quebra por fluxo, persona, dados ou regras de negócio mantendo a entrega de valor independente.
    ## 56. Prática de Gestão de Stakeholders e Comunicação (Encontro 26)
  * **Estruturação do Plano de Comunicação:**
  * *Mapeamento de Stakeholders:* Categorização em primários, secundários, chave e influenciadores com base na **Matriz Poder x Interesse**.
    * *Perfil de Comunicação:* Definição clara de *quem comunica*, *para quem*, *o quê*, *como*, *quando* e *por qual canal* (Slack, Jira, Confluence, Dashboards executivos).
    * *Gestão de Expectativas:* Uso de workshops de alinhamento, *Expectation Canvas* e acordos de colaboração (*Working Agreements*).
    * **Entregáveis da Prática:**
  1. *Mapa de Stakeholders:* Tabela com níveis de poder, interesse, expectativas e canais definidos.
    2. *Plano de Comunicação Ágil:* Frequência, formatos e matriz de responsabilidade.
    3. *Relatório do Workshop:* Registro de decisões, acordos e próximos passos.
    4. *Sistema de Feedback Contínuo:* Canais estruturados (formulários, pesquisas in-app e dashboards de satisfação com métricas de tempo de resposta e NPS).

# SDE - T05433 - Gestão de Projetos de TI (Parte 15)-->
## 57. Sistema de Feedback Contínuo e Melhoria da Comunicação (Encontro 26 - Continuação)
* **Processo de Ciclo Fechado (*Feedback Loop*):**
  * *Revisão de Métricas:* Acompanhamento contínuo de indicadores (NPS, CSAT, tempo de resposta, taxa de leitura).
    * *Reavaliação Estratégica:* Verificação da adequação da abordagem perante os objetivos do negócio.
    * *Aplicação e Comunicação de Ajustes:* Implementação de melhorias práticas a partir do feedback coletado (com taxa de aplicação superior a 85% em times maduros) e divulgação transparente aos stakeholders.
    * **Entregáveis da Prtica de Stakeholders:**
  1. *Mapa de Stakeholders:* Classificação completa e matriz de engajamento.
    2. *Plano de Comunicação Ágil:* Canais, frequências e formatos estabelecidos.
    3. *Relatório de Workshop:* Atividades, acordos e direcionamentos.
    4. *Sistema de Feedback:* Canais de coleta, processo de análise, métricas de acompanhamento e planos de ação.
    ## 58. Fundamentos e Categorias de Métricas Ágeis (Encontro 27)
  * **Objetivos e Premissas Fundamentais:**
  * Fundamentação da tomada de decisão em dados objetivos, aumento da previsibilidade do fluxo, apoio à melhoria contínua e eliminação de microgestão.
    * *Regra de Ouro:* Foco no aprendizado e no diálogo construtivo, **nunca em punição ou controle individual**.
    * **Categorias de Métricas:**
  1. *Fluxo:* Analisam a fluidez e os gargalos do processo (*Lead Time*, *Cycle Time*, *WIP*, *Throughput*, *Aging WIP*).
    2. *Qualidade:* Avaliam a excelência técnica (*Taxa de retrabalho*, *Cobertura de testes*, *Defeitos em produção*).
    3. *Valor:* Medem o impacto real para o negócio e clientes (validação de hipóteses, alinhamento com OKRs, NPS).
    4. *Engajamento:* Avaliam a saúde, participação e bem-estar do time.
    * **Contextualização por Frameworks:**
  * *Scrum:* Velocity, Burndown, Burnup, Throughput e WIP.
    * *Kanban:* Lead/Cycle Time, CFD, Aging WIP, limites de WIP e Classes de Serviço.
    * *SAFe:* Predictability Measure, Program Burndown e Velocity por ART.
    ## 59. Gestão Avançada de Riscos e Incertezas em Ambientes Ágeis (Encontro 28)
  * **Conceitos e Diferenciação:**
  * *Risco:* Evento incerto, mensurável, com probabilidade e impacto estimados.
    * *Incerteza:* Falta de evidência prévia, tratada de forma iterativa por meio de experimentação e aprendizado rápido.
    * **Técnicas Ágeis de Identificação e Modelagem:**
  * *Risk Storming:* Workshop colaborativo multidisciplinar.
    * *Assumption Mapping:* Mapeamento de premissas cruzando conhecimento versus evidência.
    * *Pre-Mortem Analysis:* Simulação retroativa de fracasso do projeto para mitigar pontos cegos.
    * **Métricas e Ferramentas Quantitativas:**
  * *Risk Exposure Total* e *Risk Burndown Chart* para monitoramento dinâmico da carga de risco.
    * *Simulações de Monte Carlo* para previsões probabilísticas de entrega (percentis P10, P50, P90).
    * *Risk-Aware Definition of Done (DoD):* Inclusão de testes de segurança, planos de rollback e monitoramento ativo diretamente nos critérios de aceite das histórias.

# SDE - T05433 - Gestão de Projetos de TI (Parte 16)-->
## 60. Conclusão da Gestão de Riscos e Práticas Avançadas (Encontro 28 - Final)
* **Integração Diária e Retrospectiva:**
  * *Standup (Daily):* Inclusão rápida de checagem de riscos e novos gatilhos (1-2 minutos).
    * *Retrospectiva Focada em Riscos:* Análise de riscos materializados, eficácia das respostas, captura de novas ameaças e melhoria contínua do processo.
    * **Critérios de Qualidade e Papéis:**
  * *Risk-Aware Definition of Done (DoD):* Inclusão de mitigações validadas, performance testada, alertas configurados e plano de rollback pronto.
    * *Risk Champion Rotativo:* Atribuição rotativa de um membro por sprint para facilitar discussões, atualizar o Risk Register e monitorar *triggers*.
    ## 61. Práticas de Qualidade e Melhoria Contínua (Encontro 29)
  * **Conceito e Pilares da Qualidade Ágil:**
  * Qualidade integrada ao fluxo de trabalho e assumida por todo o time (Processo, Técnica e Produto).
    * *Práticas Técnicas:* Testes unitários, TDD (*Test-Driven Development*), refatoração contínua, pair programming e code review.
    * *Práticas de Processo:* DoR, DoD, critérios de aceitação estruturados e controle estrito de WIP.
    * **Ciclo PDCA e Cultura de Segurança Psicológica:**
  * Aplicação contínua do ciclo *Plan-Do-Check-Act* e manutenção de um ambiente seguro onde erros são vistos como oportunidades de aprendizado (sem culpa, foco em soluções).
  ## 62. Liderança e Transformação Ágil Organizacional (Encontro 30)
  * **Diagnóstico e Condução da Mudança:**
  * Substituição de silos funcionais, culturas tradicionais e lideranças centralizadoras por estruturas horizontais e ágeis (ex.: modelo Spotify, *Team Topologies*).
    * *Papel do Líder Servidor:* Empoderamento, remoção de impedimentos, coaching contínuo e gestão por propósito.
    * **Estratégia de Implementação e Change Management:**
  * Condução de diagnósticos (*Current State Assessment*), desenho de visões de futuro, análise de gaps e estruturação de roadmaps faseados (Fundação, Expansão e Otimização).
    * Utilização de ferramentas como *Delegation Poker*, *Organizational Design Canvas* e OKRs para garantir o alinhamento estratégico e a sustentabilidade da transformação.


# SDE - T05433 - Gestão de Projetos de TI (Parte 17)-->
## 63. Configuração Inicial e Estruturação do Scrum no Projeto $NAME_PROJECT (Encontro 02-04)
* **Estrutura Base do Projeto:**
  * Organização de 16 encontros temáticos cobrindo o ciclo completo de desenvolvimento (desde a arquitetura, cadastros, fluxo de pedidos, pagamentos, rastreamento até o deploy e apresentação final).
    * *Recursos Necessários:* Stack tecnológica com Spring Boot, MySQL, Trello/Jira, GitHub, VSCode, Postman e Miro; equipe multidisciplinar composta por PO, SM e Desenvolvedores.
    * **Mapa de Stakeholders Detalhado:**
  * Categorização de envolvidos na Matriz de Influência x Interesse: *Cliente Final* (Primário, Alta/Alta), *Restaurante* (Primário, Alta/Alta), *Entregador* (Primário, Média/Alta), *CEO* (Primário, Alta/Alta), *Investidores* (Secundário, Alta/Média), *Suporte Técnico* (Secundário, Média/Média) e *Marketing* (Secundário, Baixa/Média).
  ## 64. Concepção de Visão de Produto e Governança Ágil (Scrum)
  * **Product Vision e Alinhamento Estratégico:**
  * Formulação baseada no modelo de visão (*Para [usuário], que [necessidade], o [produto] é [categoria] que [benefício]...*).
    * *Product Vision Canvas:* Definição clara do Target Group, Needs, Product, Business Goals e User Experience, apoiada por um Roadmap em 3 horizontes (MVP Core, Growth e Innovation) e OKRs de sucesso.
    * **Team Charter e Acordos de Convivência (*Working Agreements*):**
  * Documento colaborativo contendo a visão compartilhada do time, valores inegociáveis, papéis explícitos, acordos de comunicação e regras de convivência.
  * **Configuração de Ferramentas de Gestão:**
  * Estruturação inicial no Jira/Trello definindo o fluxo do Kanban (*Backlog*, *A Fazer*, *Em Progresso*, *Em Teste*, *Concluído*) e o uso de etiquetas de categorização (*Frontend*, *Backend*, *Urgente*, *Revisar*).

# SDE - T05433 - Gestão de Projetos de TI (Parte 18)-->
## 65. Configuração e Cronograma de Cerimônias Scrum (Encontro 04)
* **Estruturação do Sprint Calendar (Ciclo de 2 semanas):**
  * *Segunda-feira (Manhã):* Sprint Planning (foco em *What*, *How* e *Sprint Goal*).
    * *Diário:* Daily Scrum de 15 minutos às 9h00 (focado nas 3 perguntas essenciais e remoção de impedimentos).
    * *Quinta-feira:* Backlog Refinement (revisão de critérios de *Ready*, estimativas e clarificações, ocupando cerca de 10% do tempo da sprint).
    * *Sexta-feira:* Sprint Review (demonstração do incremento para stakeholders) + Sprint Retrospective (melhoria contínua).
    * **Biblioteca de Facilitação e Retrospectivas:**
  * Disponibilização de templates para cada cerimônia, diretrizes de facilitação para o Scrum Master e técnicas variadas de retrospectiva (ex.: *What went well*, *What could improve*, *Actions* via ferramentas como FunRetro).
  ## 66. Workshop de Product Backlog e User Stories - Product Management Ágil (Encontro 06)
  * **Evolução do MVP e Papel do Product Owner:**
  * Transformação da visão do produto em um backlog executável e priorizado para a $NAME_PROJECT (Gestão de Usuários, Restaurantes, Sistema de Pedidos, Pagamentos via PIX/Cartão e Entrega com *Tracking*).
  * **Escrita de User Stories e Critérios de Qualidade:**
  * Aplicação do formato *"Como [usuário], eu quero [funcionalidade] para [benefício]"* validado pelos critérios **INVEST** (*Independent, Negotiable, Valuable, Estimable, Small, Testable*).
    * Definição de personas centrais: *Cliente Final*, *Restaurante*, *Entregador* e *Administrador*.
    * **Story Mapping e Priorização de Releases:**
  * Organização visual da jornada do usuário horizontalmente e priorização vertical dividida em releases (MVP Essencial / Release 1, Melhorias / Release 2 e Inovações / Release 3).
    * Aplicação de métodos de priorização: **MoSCoW** (*Must Have*, *Should Have*, *Could Have*, *Won't Have*) e **Matriz Valor vs Esforço** (*Quick Wins* no topo da fila).
    * **Critérios de Aceitação e Planejamento:**
  * Estruturação de ACs no formato *Given / When / Then* e validação contra o **Definition of Ready (DoR)**.
    * Utilização do **Planning Poker** com a sequência de Fibonacci para estimativas de esforço relativas em *Story Points*.

# SDE - T05433 - Gestão de Projetos de TI (Parte 19)-->
## 67. Execução e Monitoramento Ágil: Daily Scrum e Gestão Visual (Encontro 10)
* **Facilitação do Daily Scrum e Status da Sprint 1:**
  * Simulação de Daily no Dia 5 de 10 (45% das tasks concluídas, progresso ligeiramente atrás do ideal, 3 impedimentos ativos e moral mista).
    * Gestão das 3 perguntas fundamentais com foco em energia, foco e alinhamento de papéis (*Ana, Bruno, Carlos, Diana, Eduardo e Fernanda*).
    * **Otimização do Kanban Board e Information Radiators:**
  * Implementação de colunas refinadas (*Backlog*, *To Do*, *Doing*, *Review*, *Testing*, *Done*, *Blocked*) com aplicação rigorosa de **Limites de WIP** (*Doing* $\le 4$, *Review* $\le 2$, *Testing* $\le 3$) e swimlanes por especialidade (*Frontend*, *Backend*, *DevOps*, *QA*).
    * Configuração de radiadores de informação e painéis visuais de progresso (Burndown, Velocity e *Team Mood*).
    ## 68. Gestão de Impedimentos, Coaching e Replanning (Encontro 10 - Continuação)
  * **Tratamento de Impedimentos Críticos:**
  * Mapeamento no *Impediment Register* e priorização via Matriz Impacto x Urgência (ex.: IMP001 - API de CEP instável com fallback/mock, IMP002 - Conflito de versões React resolvido via *pair programming*, e IMP003 - Acesso ao banco de produção escalado para a TI).
  * **Análise de Métricas e Ajuste de Escopo (*Replanning*):**
  * Acompanhamento do Burndown, simulação de *velocity* (atual de 2.0 pts/dia vs. necessário de 2.4 pts/dia) e avaliação de utilização de capacidade por membro.
    * *Decisão de Ajuste:* Redução de escopo (*Scope Reduction*) com a remoção da User Story de Perfil (US003) da Sprint 1 para proteger o *Sprint Goal* e garantir alta qualidade no core (*Cadastro, Login e Lista de Restaurantes*).

# SDE - T05433 - Gestão de Projetos de TI (Parte 20)-->
## 69. Realização da Sprint Review e Demonstração do Produto (Encontro 14)
* **Estruturação e Condução da Sprint Review:**
  * Preparação do ambiente de demonstração, roteiro lógico de apresentação e alinhamento das expectativas dos stakeholders (*CEO, investidores, Product Owner, usuários beta e marketing*).
    * *Demonstração Prática (Sprint 1 - 26 Story Points entregues):* Apresentação passo a passo do fluxo principal (*US001 - Cadastro de Cliente, US002 - Login/Autenticação, US003 - Busca de Restaurantes, US004 - Visualização de Cardápio e US005 - Adição ao Carrinho*).
    * **Coleta de Feedback e Atualização do Roadmap:**
  * Aplicação de formulários estruturados de feedback e sessão aberta de Q&A para categorizar sugestões (melhorias de usabilidade, novas features e ajustes técnicos).
    * Apresentação de métricas de entrega (*Burndown*, *Velocity* e qualidade) e repriorização do *Product Backlog* para a Sprint 2.
    ## 70. Condução da Sprint Retrospective e Melhoria Contínua (Encontro 16)
  * **Metodologia e Fases da Retrospectiva:**
  * Criação de um ambiente seguro (*Prime Directive*) para reflexão sobre a Sprint 1, celebrando sucessos e tratando desafios (ex.: estimativas imprecisas, ruídos de comunicação entre frontend/backend, demora na resolução de impedimentos e definição de *DoD*).
  * **Análise de Causa Raiz e Criação de Experimentos:**
  * Aplicação de técnicas de investigação (como os *5 Porquês*) para mapeamento profundo de impedimentos e disfunções da equipe.
    * *Plano de Ação e Melhorias:* Seleção de melhorias de alto valor via matriz Impacto x Esforço, desenho de experimentos práticos, atualização da *Definition of Done (DoD v2)* e estabelecimento de um board de melhoria contínua.
    ## 71. Introdução ao Kanban Avançado e Métricas de Fluxo (Encontro 18)
  * **Otimização do Fluxo de Trabalho na $NAME_PROJECT:**
  * Diagnóstico de gargalos operacionais (ex.: *Code Review* bloqueando o andamento, descobertas tardias de bugs em produção e falta de previsibilidade).
    * *Práticas de Kanban Avançado:* Mapeamento do Fluxo de Valor (*Value Stream Mapping*), definição rigida de WIP limits e estabelecimento de **Classes de Serviço** (*Expedite, Standard, Fixed Date*) com SLAs específicos.
    * **Implementação de Métricas e Previsibilidade:**
  * Rastreamento avançado de *Lead Time*, *Cycle Time*, *Throughput* e análise visual por meio do *Cumulative Flow Diagram (CFD)* e *Aging Chart*.
    * Utilização de simulações estatísticas (como **Monte Carlo**) para elevar a previsibilidade e apoiar o planejamento de capacidade da equipe (*Capacity Planning*).

# SDE - T05433 - Gestão de Projetos de TI (Parte 21)-->
## 72. Gestão de Riscos e Incertezas em Projetos Ágeis (Encontro 21 e 28)
* **Conceitos e Etapas Fundamentais:**
  * *Riscos:* Eventos incertos previsíveis com impacto mensurável.
    * *Incertezas:* Falta de informações estruturais sobre variáveis críticas.
    * *Etapas de Gestão:* Identificação proativa, análise de probabilidade/impacto, planejamento de respostas adaptáveis e monitoramento contínuo.
    * **Técnicas Avançadas e Integração Ágil:**
  * *Risk Storming & Assumption Mapping:* Mapeamento visual cruzando conhecimento versus evidência de premissas.
    * *Pre-mortem Analysis:* Simulação retroativa de falhas estruturais para prevenção precoce.
    * *Simulações Quantitativas (Monte Carlo) e Risk Burndown:* Modelagem de cenários de prazo/velocity e monitoramento da exposição total de riscos por sprint.
    ## 73. Liderança Ágil e Transformação Cultural (Encontro 23)
  * **Fundamentos e Papel do Líder Ágil:**
  * Substituição do modelo de comando-controle por liderança servil (*servant leadership*), empoderamento, escuta ativa, tomada de decisão participativa e remoção de impedimentos.
  * **Dinâmica de Transformação:**
  * Evolução de estruturas tradicionais rígidas para ambientes colaborativos de alta autonomia, com foco em propósito, transparência radical e valorização de erros como oportunidades de aprendizado.
  ## 74. Refinamento do Backlog Avançado (*Backlog Grooming*) (Encontro 25)
  * **Atividades e Benefícios Regulares:**
  * Revisão, detalhamento e priorização contínua dos itens do *Product Backlog*.
    * *Ações do Time:* Esclarecimento de requisitos, divisão de épicos em tarefas menores, inclusão de critérios de aceitação rigorosos e estimativa de esforço relativo para prevenir surpresas durante o planejamento das Sprints.
    ## 75. Gestão de Stakeholders e Comunicação em Projetos Ágeis (Encontro 26)
  * **Estratégia e Engajamento Contínuo:**
  * Identificação e mapeamento de stakeholders primários, secundários e chave utilizando a **Matriz Poder x Interesse**.
    * Construção de um plano de comunicação ágil personalizado por perfil, estruturação de radiadores de informação, workshops de alinhamento e implementação de um sistema de feedback contínuo estruturado.

# SDE - T05433 - Gestão de Projetos de TI (Parte 22)-->
## 76. Qualidade Ágil e Encerramento de Ciclos de Feedback (Encontro 29)
* **Responsabilidade Coletiva pela Qualidade:**
  * Qualidade integrada desde a concepção (testes automatizados, code reviews sistemáticos, integração contínua e documentação simples).
    * A importância de coletar feedback contínuo com usuários e stakeholders para evoluir o software sem acumular dívida técnica.
    ## 77. Liderança e Transformação Ágil Organizacional (Encontro 30 - Prática 12)
  * **Escalonamento e Diagnóstico Organizacional:**
  * Condução de diagnósticos corporativos (*Current State Assessment*) para identificar silos funcionais, processos burocráticos e resistências à mudança decorrentes do hiato entre startup e escala corporativa.
  * **Blueprint da Organização Ágil:**
  * *Team Topologies:* Desenho de *Stream-aligned teams*, *Platform teams*, *Enabling teams* e *Complicated subsystem teams*.
    * *Governança e Modelos:* Adaptação do modelo Spotify (*Tribes, Squads, Chapters, Guilds*), adoção de liderança servidora (*Servant Leadership*), delegação de autonomia via *Delegation Poker* e alinhamento estratégico por meio de OKRs e do modelo de Kotter (8 passos).

# SDE - T05433 - Gestão de Projetos de TI (Parte 23 - Conclusão)-->
## 78. Soft Skills, Comportamento e Desenvolvimento Profissional (Encontros 12 e 24)
* **Desenvolvimento Humano e Relacional:**
  * Importância crítica das *Soft Skills* na condução de projetos de TI, abrangendo comunicação empática, inteligência emocional e resolução construtiva de conflitos.
  * **Equilíbrio Técnico e Humano:**
  * Alinhamento entre a razão técnica (*hard skills*) e a sensibilidade humana para fortalecer o protagonismo pessoal, a colaboração em equipes multidisciplinares e a sustentabilidade de carreiras no setor tecnológico. 
EOF

echo "📄 Criando specs ..."

echo "✨ Estrutura do $NAME_PROJECT gerada com sucesso!"
echo "Abra a pasta '$FOLDER_PROJECT' na sua IDE e comece a interagir com a IA."