<!-- [Seq: 03] Declaração de Escopo -->
# Declaração de Escopo do Projeto — $PROJECT_NAME
**Curso:** $COURSE_NAME  
**Gerente de Projetos:** $PROJECT_MANAGER

## 1. Justificativa e Objetivo do Escopo
O escopo compreende o desenvolvimento e disponibilização da plataforma digital **$PROJECT_NAME**, conectando em tempo real $TARGET_AUDIENCE com arquitetura modular, escalável e segura desenvolvida em Java (Spring Boot) e banco relacional.

## 2. Escopo Detalhado do Produto (In-Scope)
- **Módulo de Usuários e Autenticação:** Login seguro, gestão de perfis e níveis de permissão.
- **Módulo Operacional Central:** Fluxo de operações principais ligadas a $MAIN_ENTITY.
- **Módulo de Notificações e Status:** Acompanhamento do ciclo de vida das transações em tempo real.
- **Arquitetura de Backend:** Implementação em camadas (Model, DAO/Repository, Service, Controller) com API REST documentada via Swagger / OpenAPI 3.

## 3. Limites do Projeto (Out-of-Scope)
- $OUT_OF_SCOPE_DEF
- Integração com adquirentes financeiros reais em ambiente produtivo durante a fase educacional.

## 4. Critérios de Aceitação do Escopo
1. Todos os endpoints documentados e testáveis através da interface do Swagger.
2. Persistência de dados consistente entre entidades relacionais.
3. Cobertura de testes unitários nas regras críticas da camada de serviço.
4. Demonstração funcional aprovada pelo corpo docente ao término da 16ª prática.
