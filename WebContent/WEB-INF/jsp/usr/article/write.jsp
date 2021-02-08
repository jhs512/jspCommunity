<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="pageTitle" value="${board.name} 게시물 작성" />
<%@ include file="../../part/head.jspf"%>

<div class="title-bar padding-0-10 con-min-width">
	<h1 class="con">
		<span>
			<i class="fas fa-pen"></i>
		</span>
		<span>${pageTitle}</span>
	</h1>
</div>

<div class="article-write-form-box form-box padding-0-10 con-min-width">
	<script>
	let DoWriteForm__submited = false;
	let DoWriteForm__checkedLoginId = "";
	
	// 폼 발송전 체크
	function DoWriteForm__submit(form) {
		if ( DoWriteForm__submited ) {
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
		DoWriteForm__submited = true;
	}
	</script>
	<form class="con" action="doWrite" method="POST"
		onsubmit="DoWriteForm__submit(this); return false;">
		<input type="hidden" name="boardId" value="${board.id}" />
		<input type="hidden" name="body" />

		<table>
			<colgroup>
				<col width="150">
			</colgroup>
			<tbody>
				<tr>
					<th>
						<span>제목</span>
					</th>
					<td>
						<div>
							<input name="title" type="text" maxlength="50"
								placeholder="제목을 입력해주세요." />
						</div>
					</td>
				</tr>

				<tr>
					<th>
						<span>내용</span>
					</th>
					<td>
						<div>
							<div>
								<script type="text/x-template"></script>
								<div class="toast-ui-editor"></div>
							</div>
						</div>
					</td>
				</tr>

				<tr>
					<th>
						<span>작성</span>
					</th>
					<td>
						<div>
							<div class="btn-wrap">
								<input class="btn btn-primary" type="submit" value="작성" />
								<button class="btn btn-info" type="button" onclick="history.back();">뒤로가기</button>
							</div>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
<%@ include file="../../part/foot.jspf"%>