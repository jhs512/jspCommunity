<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="${article.extra__boardName} 게시물 상세페이지" />
<%@ include file="../../part/head.jspf"%>

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
			<a class="btn btn-primary" href="${param.listUrl}">
				<span><i class="fas fa-thumbs-up"></i></span>
				<span>좋아요</span>
			</a>
		</c:if>
		
		<c:if test="${article.extra.actorCanCancelLike}">
			<a class="btn btn-info" href="${param.listUrl}">
				<span><i class="fas fa-slash"></i></span>
				<span>좋아요 취소</span>
			</a>
		</c:if>
		
		<c:if test="${article.extra.actorCanDislike}">
			<a class="btn btn-danger" href="${param.listUrl}">
				<span><i class="fas fa-thumbs-down"></i></span>
				<span>싫어요</span>
			</a>
		</c:if>
		
		<c:if test="${article.extra.actorCanCancelDislike}">
			<a class="btn btn-info" href="${param.listUrl}">
				<span><span><i class="fas fa-slash"></i></span></span>
				<span>싫어요 취소</span>
			</a>
		</c:if>
		
		<a class="btn btn-info" href="${param.listUrl}">리스트</a>
		<a class="btn btn-info" href="modify?id=${article.id}">수정</a>
		<a class="btn btn-danger" onclick="if ( confirm('정말 삭제하시겠습니까?') == false ) { return false; }"
		href="doDelete?id=${article.id}">삭제</a>
	</div>
</div>

<%@ include file="../../part/foot.jspf"%>