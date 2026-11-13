<!-- [Seq: 04] Arquitetura Técnica -->
# Especificação da Arquitetura Técnica — $PROJECT_NAME
**Curso:** $COURSE_NAME  
**Gerente de Projetos:** $PROJECT_MANAGER  

## 1. Visão Geral da Arquitetura
A plataforma $PROJECT_NAME adota o padrão de **Arquitetura em Camadas (Layered Architecture)** sobre o framework **Spring Boot (Java 17+)**, garantindo desacoplamento, testabilidade e separação de responsabilidades.

```
┌────────────────────────────────────────────────────────┐
│               Camada de Apresentação                   │
│          REST Controllers / Swagger OpenAPI 3          │
└──────────────────────────┬─────────────────────────────┘
                           │ (DTOs / Requisições HTTP)
┌──────────────────────────▼─────────────────────────────┐
│                 Camada de Negócio                      │
│             Services / Validações / Regras             │
└──────────────────────────┬─────────────────────────────┘
                           │ (Model / Entidades JPA)
┌──────────────────────────▼─────────────────────────────┐
│                Camada de Persistência                  │
│       Spring Data JPA Repositories (Padrão DAO)        │
└──────────────────────────┬─────────────────────────────┘
                           │ (SQL / JDBC)
┌──────────────────────────▼─────────────────────────────┐
│                   Banco de Dados                       │
│    H2 Database (Dev/Testes) / MySQL/PostgreSQL (Prod)  │
└────────────────────────────────────────────────────────┘
```

## 2. Stack Tecnológica de Referência
- **Backend:** Java 17+ com **Spring Boot 3.x**
- **Persistência de Dados:** Padrão **DAO / Spring Data JPA** garantindo desacoplamento.
- **Banco de Dados:** H2 Database em memória (dev/testes) e MySQL/PostgreSQL para persistência.
- **Documentação de Endpoints:** **Swagger / OpenAPI 3** com interface interativa.
- **Controle de Versão:** Git + GitHub com fluxo baseado em branches.
