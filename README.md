# sprintSCrum 1
#Day 1: Cấu hình giao diện và làm bài tập tuần, thảo luận bài tập
#day 2: cấu hình JPA và hibernate
#day 3: Tạo etity và làm các lớp DAO
#day 4: Tạo các file JPA, phần src
#day 5: Tiến hành chia luồng chức năng
#day 6: Làm chức năng đăng nhập, luồng url
#day 7: làm chức năng đăng nhập và figma

# sprintSCrum 2
#Day 1: Làm các giao diện figma và chức năng load thông tin user
#day 2: Chia 4 actor: lecturer. headlecturer. student, admin
#day 3: cài đặt giao diện, làm bài tập tuần 
#day 4: Xây dựng chức năng các actor
#day 5: Xây dựng chức năng các actor 
#day 6: Xây dựng chức năng các actor
#day 7: Xây dựng chức năng các actor
---
-clone project: https://github.com/CNPM09/sprintCrum/tree/main/Web_DkDeTai
- chạy file dkDeTai.sql ---> My SQL
-- Tomcat 9.0

![Java](https://img.shields.io/badge/java-%23ED8B00.svg?style=for-the-badge&logo=java&logoColor=white)
![HTML5](https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/css3-%231572B6.svg?style=for-the-badge&logo=css3&logoColor=white)
![JavaScript](https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E)
![Bootstrap](https://img.shields.io/badge/bootstrap-%23563D7C.svg?style=for-the-badge&logo=bootstrap&logoColor=white)
![jQuery](https://img.shields.io/badge/jquery-%230769AD.svg?style=for-the-badge&logo=jquery&logoColor=white)
![Apache Maven](https://img.shields.io/badge/Apache%20Maven-C71A36?style=for-the-badge&logo=Apache%20Maven&logoColor=white)
![Apache Tomcat](https://img.shields.io/badge/apache%20tomcat-%23F8DC75.svg?style=for-the-badge&logo=apache-tomcat&logoColor=black)
![MySQL](https://img.shields.io/badge/mysql-%2300f.svg?style=for-the-badge&logo=mysql&logoColor=white)
![hibernate](https://img.shields.io/badge/hibernate-%20brightgreen.svg?&style=for-the-badge&logo=hibernate&logoColor=white)
![IntelliJ IDEA](https://img.shields.io/badge/IntelliJIDEA-000000.svg?style=for-the-badge&logo=intellij-idea&logoColor=white)
![junit](https://img.shields.io/badge/junit-%20yellowgreen.svg?&style=for-the-badge&logo=junit&logoColor=white)

## Overview

- Technical: **JSP** (**J**akarta **S**erver **P**ages) and **Servlet**
    - [**Java Servlet API 4.0.1**](https://mvnrepository.com/artifact/javax.servlet/javax.servlet-api/4.0.1)
    - [**JavaServer Pages(TM) API 2.3.3**](https://mvnrepository.com/artifact/javax.servlet.jsp/javax.servlet.jsp-api)
    - [**JSTL 1.2**](https://mvnrepository.com/artifact/javax.servlet/jstl/1.2)
    - [**JavaMail API 1.6.2**](https://mvnrepository.com/artifact/com.sun.mail/javax.mail/1.6.2)
- Build: **Maven Project 4.0.0**
- [**Apache Tomcat® 9.x**](https://tomcat.apache.org/download-90.cgi)
- Relational database management system: [**MySQL Connector Java 8.0.31**](https://mvnrepository.com/artifact/mysql/mysql-connector-java/8.0.31)
- Hibernate core ORM functionality: [**Hibernate 5.4.33.Final**](https://mvnrepository.com/artifact/org.hibernate/hibernate-core/6.1.5.Final)
- Integration for c3p0 Connection pooling into Hibernate ORM: [**Hibernate C3P0 Relocation 5.6.14.Final**](https://mvnrepository.com/artifact/org.hibernate/hibernate-c3p0/5.6.14.Final)

- Testing framework:
    - JUnit Jupiter is the API for writing tests using JUnit 5: [**JUnit Jupiter API 5.9.1**](https://mvnrepository.com/artifact/org.junit.jupiter/junit-jupiter-api/5.9.1)
    - Core package for the JUnit Jupiter test engine: [**JUnit Jupiter Engine 5.9.1**](https://mvnrepository.com/artifact/org.junit.jupiter/junit-jupiter-engine/5.9.1)

- PayPal SDK for integrating with the REST APIs: [**REST API SDK 1.14.0**](https://mvnrepository.com/artifact/com.paypal.sdk/rest-api-sdk/1.14.0)

- Frontend frameworks :
    - [**Bootstrap**](https://getbootstrap.com/) - Powerful, extensible, and feature-packed frontend toolkit.
    - [**jQuery**](https://jquery.com/) - jQuery is a fast, small, and feature-rich JavaScript library.
    - [**AJAX**]() (**A**synchronous **J**avaScript **a**nd **X**ML) - send and retrieve data from a server
      asynchronously without interfering with the display and behaviour of the existing page.

- Design pattern : **M**odel - **V**iew - **C**ontroller (**MVC**), **D**ata **A**ccess **O**bject (**DAO**)
- Integrated development environment (IDE) : **IntelliJ IDEA Ultimate**

## How to run

1. Download and setup [IntelliJ IDEA Ultimate](https://www.jetbrains.com/idea/download/#section=windows).
2. Download and setup [MySQL Community Server](https://dev.mysql.com/downloads/mysql/) and [MySQL Workbench](https://dev.mysql.com/downloads/workbench/).
3. Download this repository.
4. MySQL Workbench -> Server -> Data Import -> Import from Self-Contained File -> ... -> Select Database to Import -> Choose Dump Structure and Data -> Start Import.
5. IntelliJ -> Open.
6. Wait for Maven download and setup dependencies.
7. Setup [Apache Tomcat](https://tomcat.apache.org/).
8. Enjoy ☺️.

## Note

1. Change the MySQL connection in <a href="./src/main/java/META-INF/persistence.xml" target="_blank">persistence.xml</a> to
   your localhost.
2. Password field of user and customer is encrypted by MD5. Use this for login:

    - For user: admin@gmail.com | admin
    - For customer: customer@gmail.com | customer

3. Set environment variables in <a href="./eCommerceWebsite/src/main/webapp/WEB-INF/web.xml" target="_blank">web.xml</a>
   for SMTP mail before run.

| Variables     | Require | Description                                                                                | Default        |
|---------------|---------|--------------------------------------------------------------------------------------------|----------------|
| SMTP_HOST     | ❌       | The SMTP server to connect to                                                              | smtp.gmail.com |
| SMTP_PORT     | ❌       | The SMTP server port to connect to, if the connect() method doesn't explicitly specify one | 25/587         |
| SMTP_USER     | ✔       | Username for SMTP Authenticator                                                            |                |
| SMTP_PASSWORD | ✔       | Password for SMTP Authenticator                                                            |                |
