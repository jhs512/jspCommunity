<%@ page import="com.sbs.example.util.Util" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
Object data = request.getAttribute("data");
response.getWriter().print(Util.getJsonText(data));
%>
