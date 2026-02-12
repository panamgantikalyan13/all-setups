sudo yum install java-17-amazon-corretto -y
java -version
wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.87/bin/apache-tomcat-9.0.87.tar.gz
tar -xzf apache-tomcat-9.0.87.tar.gz
mv apache-tomcat-9.0.87 tomcat9
cd tomcat9
cat <<EOF > conf/tomcat-users.xml
<?xml version="1.0" encoding="UTF-8"?>
<tomcat-users xmlns="http://tomcat.apache.org/xml"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              xsi:schemaLocation="http://tomcat.apache.org/xml tomcat-users.xsd"
              version="1.0">

<role rolename="manager-gui"/>
<role rolename="manager-script"/>
<user username="tomcat" password="admin@123" roles="manager-gui,manager-script"/>

</tomcat-users>
EOF
sed -i '/RemoteAddrValve/d' webapps/manager/META-INF/context.xml
chmod +x bin/*.sh
sh bin/startup.sh
ps -ef | grep tomcat
