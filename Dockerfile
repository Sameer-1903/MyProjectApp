FROM tomcat:8.0.20-jre8
# COPY target/*.war /usr/local/tomcat/webapps/myprojectapp.war
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war