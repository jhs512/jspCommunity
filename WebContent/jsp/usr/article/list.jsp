<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="${board.name} 게시물 리스트" />
<%@ include file="../../part/head.jspf"%>

<div class="title-bar padding-0-10 con-min-width">
	<h1 class="con">
		<span>
			<i class="fas fa-list"></i>
		</span>
		<span>${pageTitle}</span>
	</h1>
</div>

<div class="article-search-form-box form-box padding-0-10 con-min-width">
	<script>
	let DoSearchForm__submited = false;
	function DoSearchForm__submit(form) {
		if ( DoSearchForm__submited ) {
			alert('처리중입니다');
			return;
		}
	
		form.searchKeyword.value = form.searchKeyword.value.trim();
		
		if ( form.searchKeyword.value.length == 0 ) {
			alert('검색어를 입력해주세요.');
			form.searchKeyword.focus();
			return;
		}
		
		form.submit();
		DoSearchForm__submited = true;
	}
	</script>
	<form class="con" onsubmit="DoSearchForm__submit(this); return false;">
		<input type="hidden" name="boardId" value="${param.boardId}" />

		<table>
			<colgroup>
				<col width="150">
			</colgroup>
			<tbody>
				<tr>
					<th>
						<span> 검색조건</span>
					</th>
					<td>
						<div>
							<select name="searchKeywordType">
								<option value="titleAndBody">제목+본문</option>
								<option value="title">제목</option>
								<option value="body">본문</option>
							</select>
						</div>
						<script>
						const param__searchKeywordType = '${param.searchKeywordType}';
						
						if ( param__searchKeywordType ) {
							$('select[name="searchKeywordType"]').val(param__searchKeywordType);
						}
						</script>
					</td>
				</tr>
				<tr>
					<th>
						<span>검색어</span>
					</th>
					<td>
						<div>
							<input value="${param.searchKeyword}" type="text"
								name="searchKeyword" placeholder="검색어를 입력해주세요." />
						</div>
					</td>
				</tr>
				<tr>
					<th>
						<span>검색</span>
					</th>
					<td>
						<div>
							<input class="btn btn-primary" type="submit" value="검색" />
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>

<div class="article-list-total-count-box padding-0-10 con-min-width">
	<div class="con">
		<div>
			<span>
				<i class="fas fa-clipboard-list"></i>
			</span>
			<span>총 게시물 수 : </span>
			<span class="color-red">
				${totalCount}
			</span>	
		</div>
	</div>
</div>

<div class="article-list-box padding-0-10 con-min-width">
	<div class="con">
		<table>
			<colgroup>
				<col width="100">
				<col width="200">
				<col width="150">
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>날짜</th>
					<th>작성자</th>
					<th>제목</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${articles}" var="article">
					<tr>
						<td>
							<span class="article-list-box__id">${article.id}</span>
						</td>
						<td>
							<span class="article-list-box__reg-date">${article.regDate}</span>
						</td>
						<td>
							<span class="article-list-box__writer">${article.extra__writer}</span>
						</td>
						<td>
							<a href="../article/detail?id=${article.id}&listUrl=${encodedCurrentUrl}"
								class="article-list-box__title article-list-box__title--pc hover-link">${article.title}</a>
						</td>
						<td class="visible-sm-down">
							<div class="flex">
								<span class="article-list-box__id article-list-box__id--mobile">${article.id}</span>

								<a href="../article/detail?id=${article.id}&listUrl=${encodedCurrentUrl}"
									class="article-list-box__title article-list-box__title--mobile flex-grow-1 hover-link">${article.title}</a>
							</div>

							<div class="flex">
								<span
									class="article-list-box__writer article-list-box__writer--mobile">${article.extra__writer}</span>
								<span>|</span>
								<span
									class="article-list-box__reg-date article-list-box__reg-date--mobile">${article.regDate}</span>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<div class="article-btn-box padding-0-10 con-min-width">
	<div class="con btn-wrap">
		<a class="btn btn-primary" href="write?boardId=${param.boardId}">글쓰기</a>
	</div>
</div>

<div class="article-list-page-box padding-0-10 con-min-width">
	<div class="con flex flex-jc-c">
		<c:if test="${pageBoxStartBeforeBtnNeedToShow}">
			<c:set var="aUrl"
				value="?page=${pageBoxStartBeforePage}&boardId=${param.boardId}&searchKeywordType=${param.searchKeywordType}&searchKeyword=${param.searchKeyword}" />
			<a href="${aUrl}">◀</a>
		</c:if>
		<c:forEach var="i" begin="${pageBoxStartPage}" end="${pageBoxEndPage}"
			step="1">
			<c:set var="aClass" value="${page == i ? 'color-red' : ''}" />
			<c:set var="aUrl"
				value="?page=${i}&boardId=${param.boardId}&searchKeywordType=${param.searchKeywordType}&searchKeyword=${param.searchKeyword}" />
			<a class="${aClass} article-list-page-box__page-btn--no"
				href="${aUrl}">${i}</a>
		</c:forEach>

		<c:if test="${pageBoxEndAfterBtnNeedToShow}">
			<c:set var="aUrl"
				value="?page=${pageBoxEndAfterPage}&boardId=${param.boardId}&searchKeywordType=${param.searchKeywordType}&searchKeyword=${param.searchKeyword}" />
			<a href="${aUrl}">▶</a>
		</c:if>
	</div>
</div>

<%@ include file="../../part/foot.jspf"%>