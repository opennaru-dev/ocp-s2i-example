<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %><%--
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

<h1>test-maven-war http</h1>
  
  
<%
    try {

        String serverName = request.getServerName();
        int serverPort = request.getServerPort();
        String contextPath = request.getContextPath();

        //연결할 controller의 @RequestMapping Value
        String chartUrl = request.getParameter("url"); //ex: /chart/drawBarChart
        String queryString = request.getQueryString();
        //String address = "http://localhost:7001/gcss/chart/drawBarChart.do";

        if (chartUrl != null) {
            //chart 요청 url
            String address = "http://eap-app.test1.svc:8080/index.jsf";

            URL url = new URL(address);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.connect();

            BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line;
            StringBuffer sb = new StringBuffer();
            while ((line = rd.readLine()) != null) {
                sb.append(line);
                sb.append(System.getProperty("line.separator"));
            }
            rd.close();

            out.print(sb.toString());
        }

    } catch (Exception e) {
        e.printStackTrace();
    }



%>

</body>
</html>
