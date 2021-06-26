<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- 设置路径 -->
<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>

<!-- jquery -->
<script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.6.0.js"></script>
<!-- Bootstrap -->
<link type="text/css" rel="stylesheet" href="${APP_PATH}/static/bootstrap-3.4.1-dist/css/bootstrap.min.css"/>
<script type="text/javascript" src="${APP_PATH}/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
