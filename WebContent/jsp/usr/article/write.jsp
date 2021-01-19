<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<c:set var="pageTitle" value="${board.name} 게시물 작성" />
<%@ include file="../../part/head.jspf"%>
<h1>${pageTitle}</h1>

<div>
	<form action="doWrite" method="POST">
		<input type="hidden" name="boardId" value="${board.id}" />

		<hr />
		<div>
			<div>제목</div>
			<div>
				<input name="title" type="text" maxlength="50"
					placeholder="제목을 입력해주세요." />
			</div>
		</div>

		<hr />

		<div>
			<div>내용</div>
			<div>
				<textarea placeholder="내용을 입력해주세요." name="body" maxlength="5000"></textarea>
			</div>
		</div>
		<hr />
		<div>
			<div>작성</div>
			<div>
				<input type="submit" value="작성" />
				<button type="button" onclick="history.back();">뒤로가기</button>
			</div>
		</div>
	</form>
</div>
<%@ include file="../../part/foot.jspf"%>