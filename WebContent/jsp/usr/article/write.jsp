<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<title>게시물 작성페이지</title>
</head>
<body>
	<h1>게시물 작성페이지</h1>
	
	<div>
		<form action="doWrite" method="POST">
			<input type="hidden" name="boardId" value="<%=request.getParameter("boardId")%>" />
			<input type="hidden" name="memberId" value="1" />
			<div>
				<div>게시판 번호</div>
				<div><%=request.getParameter("boardId")%></div>
			</div>
			
			<hr />
			<div>
				<div>제목</div>
				<div><input type="text" maxlength="50" placeholder="제목을 입력해주세요." /></div>
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
</body>
</html>