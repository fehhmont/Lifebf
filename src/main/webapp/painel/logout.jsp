<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    session.invalidate(); // Remove os dados da sessão
    response.sendRedirect("../login.html");
%>