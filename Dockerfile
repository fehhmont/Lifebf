# Imagem base com Tomcat e Java
FROM tomcat:9.0-jdk17

# Remove as aplicações padrão do Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copia seu .war gerado para a pasta de deploy do Tomcat
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

# Expõe a porta padrão do Tomcat
EXPOSE 8080