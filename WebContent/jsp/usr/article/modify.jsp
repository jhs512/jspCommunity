<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="${board.name} 게시물 수정" />
<%@ include file="../../part/head.jspf"%>
<h1>${pageTitle}</h1>

<div>
	<script>
	let DoModifyForm__submited = false;
	let DoModifyForm__checkedLoginId = "";
	
	// 폼 발송전 체크
	function DoModifyForm__submit(form) {
		if ( DoModifyForm__submited ) {
			alert('처리중입니다.');
			return;
		}
	
		form.title.value = form.title.value.trim();
	
		if ( form.title.value.length == 0 ) {
			alert('제목을 입력해주세요.');
			form.title.focus();
			
			return;
		}
		
		const editor = $(form).find('.toast-ui-editor').data('data-toast-editor');
		const body = editor.getMarkdown().trim();
		
		if ( body.length == 0 ) {
			alert('내용을 입력해주세요.');
			editor.focus();
			
			return;
		}
		
		form.body.value = body;
		
		form.submit();
		DoModifyForm__submited = true;
	}
	</script>
	<form action="doModify" method="POST" onsubmit="DoModifyForm__submit(this); return false;">
		<input type="hidden" name="id" value="${article.id}" />
		<input type="hidden" name="body" />
		
		<hr />
		<div>
			<div>제목</div>
			<div>
				<input name="title" type="text" maxlength="50"
					placeholder="제목을 입력해주세요." value="${article.title}" />
			</div>
		</div>

		<hr />

		<div>
			<div>내용</div>
			<div>
				<script type="text/x-template">${article.body}</script>
 				<div class="toast-ui-editor"></div>
			</div>
		</div>
		<hr />
		<div>
			<div>수정</div>
			<div>
				<input type="submit" value="수정" />
				<button type="button" onclick="history.back();">뒤로가기</button>
			</div>
		</div>
	</form>
</div>

<%@ include file="../../part/foot.jspf"%>
