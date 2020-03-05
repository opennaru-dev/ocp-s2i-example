<%--
  Created by IntelliJ IDEA.
  User: ddakker
  Date: 2019-07-30
  Time: 오후 4:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>test-s2i-maven-web-source</title>
</head>
<body>

<h1>test-maven-war</h1>
  
  
<%

    out.println("<br>getRequestURL():" + request.getRequestURL());
    out.println("<br>getRequestURI():" + request.getRequestURI());
    out.println("<br>getServletPath():" + request.getServletPath());
    out.println("<br>getRemoteAddr():" + request.getRemoteAddr());
    out.println("<br>getRemoteHost():" + request.getRemoteHost());
    out.println("<br>getLocalAddr():" + request.getLocalAddr());
    out.println("<br>getServerName():" + request.getServerName());
    out.println("<br>getServerPort():" + request.getServerPort());
    out.println("<br>isSecure():" + request.isSecure());
    out.println("<br>getScheme():" + request.getScheme());



    String[] header_IPs = {
            "HTTP_CLIENT_IP", "HTTP_X_FORWARDED_FOR", "HTTP_X_FORWARDED"
            , "HTTP_X_CLUSTER_CLIENT_IP", "HTTP_FORWARDED_FOR", "HTTP_FORWARDED"
            , "X-Forwarded-For", "Proxy-Client-IP", "WL-Proxy-Client-IP"
    } ;

    for (String header : header_IPs) {
        String ip = request.getHeader(header);
        out.println("<br>" + header + ": " + ip);
        if (ip != null && !"unknown".equalsIgnoreCase(ip) && ip.length() != 0) {
            out.println("<br>ip:" + ip);
        }
    }

%>

</body>
</html>
