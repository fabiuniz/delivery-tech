# Propriedades da Aplicação - $PROJECT_NAME
server.port=$SERVER_PORT
spring.application.name=$ARTIFACT_ID
spring.datasource.url=jdbc:h2:mem:${ARTIFACT_ID}db
spring.datasource.driverClassName=org.h2.Driver
spring.datasource.username=sa
spring.datasource.password=
spring.jpa.database-platform=org.hibernate.dialect.H2Dialect
spring.h2.console.enabled=true
