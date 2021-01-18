<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.List"%>
<%@ page import="com.sbs.example.jspCommunity.dto.Article"%>
<%@ page import="com.sbs.example.jspCommunity.dto.Board"%>
<%
Board board = (Board) request.getAttribute("board");
List<Article> articles = (List<Article>) request.getAttribute("articles");

String pageTitle = board.getName() + " 게시물 리스트";
%>
<%@ include file="../../part/head.jspf"%>
<h1><%=pageTitle%></h1>

<div>
	<a href="write?boardId=${param.boardId}">게시물 작성</a>
</div>
<%
for (Article article : articles) {
%>
<div>
	번호 :
	<%=article.getId()%>
	<br />
	작성날짜 :
	<%=article.getRegDate()%>
	<br />
	갱신날짜 :
	<%=article.getUpdateDate()%>
	<br />
	작성자 :
	<%=article.getExtra__writer()%>
	<br />
	제목 :
	<a href="detail?id=<%=article.getId()%>"><%=article.getTitle()%></a>
	<hr />
</div>
<%
}
%>
<%@ include file="../../part/foot.jspf"%>