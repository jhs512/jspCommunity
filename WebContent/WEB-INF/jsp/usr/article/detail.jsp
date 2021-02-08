<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.sbs.example.util.Util"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="${article.extra__boardName} 게시물 상세페이지" />
<%@ include file="../../part/head.jspf"%>

<script>
	$(function() {
		if ( param.focusReplyId ) {
			const $target = $('.reply-list-box tr[data-id="' + param.focusReplyId + '"]');
			$target.addClass('focus');
		
			setTimeout(function() {
				const targetOffset = $target.offset();
				
				$(window).scrollTop(targetOffset.top - 100);
				
				setTimeout(function() {
					$target.removeClass('focus');
				}, 1000);
			}, 1000);
		}
	});
</script>

<div class="title-bar padding-0-10 con-min-width">
	<h1 class="con">
		<span>
			<i class="fas fa-newspaper"></i>
		</span>
		<span>${pageTitle}</span>
	</h1>
</div>

<div class="article-detail-box detail-box padding-0-10 con-min-width">
	<div class="con">
		<table>
			<colgroup>
				<col width="150">
			</colgroup>
			<tbody>
				<tr>
					<th>
						<span>번호</span>
					</th>
					<td>
						<div>${article.id}</div>
					</td>
				</tr>
				<tr>
					<th>
						<span>작성날짜</span>
					</th>
					<td>
						<div>${article.regDate}</div>
					</td>
				</tr>
				<tr>
					<th>
						<span>갱신날짜</span>
					</th>
					<td>
						<div>${article.updateDate}</div>
					</td>
				</tr>
				<tr>
					<th>
						<span>작성자</span>
					</th>
					<td>
						<div>${article.extra__writer}</div>
					</td>
				</tr>
				<tr>
					<th>
						<span>좋아요</span>
					</th>
					<td>
						<div>${article.extra__likeOnlyPoint}</div>
					</td>
				</tr>
				<tr>
					<th>
						<span>싫어요</span>
					</th>
					<td>
						<div>${article.extra__dislikeOnlyPoint}</div>
					</td>
				</tr>
				<tr>
					<th>
						<span>제목</span>
					</th>
					<td>
						<div>${article.title}</div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<script type="text/x-template">${article.body}</script>
						<div class="toast-ui-viewer"></div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>

<div class="article-btn-box padding-0-10 con-min-width">
	<div class="con btn-wrap">
		<c:if test="${article.extra.actorCanLike}">
			<a class="btn btn-primary"
				href="../like/doLike?relTypeCode=article&relId=${article.id}&redirectUrl=${encodedCurrentUrl}"
				onclick="if ( !confirm('`좋아요` 처리 하시겠습니까?') ) return false;">
				<span>
					<i class="far fa-thumbs-up"></i>
				</span>
				<span>좋아요</span>
			</a>
		</c:if>

		<c:if test="${article.extra.actorCanCancelLike}">
			<a class="btn btn-info"
				href="../like/doCancelLike?relTypeCode=article&relId=${article.id}&redirectUrl=${encodedCurrentUrl}"
				onclick="if ( !confirm('`좋아요`를 취소 처리 하시겠습니까?') ) return false;">
				<span>
					<i class="fas fa-slash"></i>
				</span>
				<span>좋아요 취소</span>
			</a>
		</c:if>

		<c:if test="${article.extra.actorCanDislike}">
			<a class="btn btn-danger"
				href="../like/doDislike?relTypeCode=article&relId=${article.id}&redirectUrl=${encodedCurrentUrl}"
				onclick="if ( !confirm('`싫어요` 처리 하시겠습니까?') ) return false;">
				<span>
					<i class="far fa-thumbs-down"></i>
				</span>
				<span>싫어요</span>
			</a>
		</c:if>

		<c:if test="${article.extra.actorCanCancelDislike}">
			<a class="btn btn-info"
				href="../like/doCancelDislike?relTypeCode=article&relId=${article.id}&redirectUrl=${encodedCurrentUrl}"
				onclick="if ( !confirm('`싫어요`를 취소 처리 하시겠습니까?') ) return false;">
				<span>
					<span>
						<i class="fas fa-slash"></i>
					</span>
				</span>
				<span>싫어요 취소</span>
			</a>
		</c:if>

		<a class="btn btn-info" href="${param.listUrl}">리스트</a>
		<a class="btn btn-info" href="modify?id=${article.id}">수정</a>
		<a class="btn btn-danger"
			onclick="if ( confirm('정말 삭제하시겠습니까?') == false ) { return false; }"
			href="doDelete?id=${article.id}">삭제</a>
	</div>
</div>

<div class="title-bar padding-0-10 con-min-width">
	<h1 class="con">
		<span>
			<i class="fas fa-newspaper"></i>
		</span>
		<span>댓글작성</span>
	</h1>
</div>

<c:if test="${isLogined == false}">
	<div class="reply-write-form-box form-box padding-0-10 con-min-width">
		<div class="con">
			<a class="udl hover-link"
				href="../member/login?afterLoginUrl=${encodedCurrentUrl}">로그인</a>
			후 이용해주세요.
		</div>
	</div>
</c:if>
<c:if test="${isLogined}">
	<div class="reply-write-form-box form-box padding-0-10 con-min-width">
		<script>
		let Reply__DoWriteForm__submited = false;
		let Reply__DoWriteForm__checkedLoginId = "";
		
		// 폼 발송전 체크
		function Reply__DoWriteForm__submit(form) {
			if ( Reply__DoWriteForm__submited ) {
				alert('처리중입니다.');
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
			Reply__DoWriteForm__submited = true;
		}
		</script>

		<form class="con" action="../reply/doWrite" method="POST"
			onsubmit="Reply__DoWriteForm__submit(this); return false;">
			<input type="hidden" name="redirectUrl"
				value="${Util.getNewUrl(currentUrl, 'focusReplyId', '[NEW_REPLY_ID]')}" />
			<input type="hidden" name="relTypeCode" value="article" />
			<input type="hidden" name="relId" value="${article.id}" />
			<input type="hidden" name="body" />

			<table>
				<colgroup>
					<col width="150">
				</colgroup>
				<tbody>
					<tr>
						<th>
							<span>내용</span>
						</th>
						<td>
							<div>
								<div>
									<script type="text/x-template"></script>
									<div class="toast-ui-editor" data-height="200"></div>
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
									<button class="btn btn-info" type="button"
										onclick="history.back();">뒤로가기</button>
								</div>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</c:if>

<div class="title-bar padding-0-10 con-min-width">
	<h1 class="con">
		<span>
			<i class="fas fa-list"></i>
		</span>
		<span>댓글 리스트</span>
	</h1>
</div>

<div class="reply-list-total-count-box padding-0-10 con-min-width">
	<div class="con">
		<div>
			<span>
				<i class="fas fa-clipboard-list"></i>
			</span>
			<span>총 게시물 수 : </span>
			<span class="color-red"> ${replies.size()} </span>
		</div>
	</div>
</div>

<div class="reply-list-box response-list-box padding-0-10 con-min-width">
	<div class="con">
		<table>
			<colgroup>
				<col width="50">
				<col width="150">
				<col width="100">
				<col width="100">
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>날짜</th>
					<th>작성자</th>
					<th>좋아요</th>
					<th>내용</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${replies}" var="reply">
					<tr data-id="${reply.id}">
						<td>
							<span class="response-list-box__id">${reply.id}</span>
						</td>
						<td>
							<span class="response-list-box__reg-date">${reply.regDate}</span>
						</td>
						<td>
							<span class="response-list-box__writer">${reply.extra__writer}</span>
						</td>
						<td>
							<span class="response-list-box__likeOnlyPoint">
								<span>
									<i class="far fa-thumbs-up"></i>
								</span>
								<span> ${reply.extra__likeOnlyPoint} </span>
							</span>
							<span class="response-list-box__dislikeOnlyPoint">
								<span>
									<i class="far fa-thumbs-down"></i>
								</span>
								<span> ${reply.extra__dislikeOnlyPoint} </span>
							</span>
						</td>
						<td>
							<script type="text/x-template">${reply.body}</script>
							<div class="toast-ui-viewer"></div>
						</td>
						<td class="visible-sm-down">
							<div class="flex">
								<span
									class="response-list-box__id response-list-box__id--mobile">${reply.id}</span>
							</div>

							<div class="flex">
								<span class="response-list-box__likeOnlyPoint">
									<span>
										<i class="far fa-thumbs-up"></i>
									</span>
									<span> ${reply.extra__likeOnlyPoint} </span>
								</span>
								<span class="response-list-box__dislikeOnlyPoint">
									<span>
										<i class="far fa-thumbs-down"></i>
									</span>
									<span> ${reply.extra__dislikeOnlyPoint} </span>
								</span>
							</div>

							<div class="flex">
								<span
									class="response-list-box__writer response-list-box__writer--mobile">${reply.extra__writer}</span>
								<span>&nbsp;|&nbsp;</span>
								<span
									class="response-list-box__reg-date response-list-box__reg-date--mobile">${reply.regDate}</span>
							</div>

							<div>
								<script type="text/x-template">${reply.body}</script>
								<div class="toast-ui-viewer"></div>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>





<%@ include file="../../part/foot.jspf"%>