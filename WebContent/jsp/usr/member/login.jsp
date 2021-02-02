<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="pageTitle" value="로그인" />
<%@ include file="../../part/head.jspf"%>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>

<div class="title-bar padding-0-10 con-min-width">
	<h1 class="con">
		<span>
			<i class="fas fa-sign-in-alt"></i>
		</span>
		<span>${pageTitle}</span>
	</h1>
</div>

<div class="login-form-box form-box padding-0-10 con-min-width">
	<script>
	let DoLoginForm__submited = false;
	function DoLoginForm__submit(form) {
		if ( DoLoginForm__submited ) {
			alert('처리중입니다.');
			return;
		}
	
		form.loginId.value = form.loginId.value.trim();
	
		if ( form.loginId.value.length == 0 ) {
			alert('로그인 아이디를 입력해주세요.');
			form.loginId.focus();
			
			return;
		}
		
		form.loginPw.value = form.loginPw.value.trim();
	
		if ( form.loginPw.value.length == 0 ) {
			alert('로그인 비밀번호를 입력해주세요.');
			form.loginPw.focus();
			
			return;
		}
		
		form.loginPwReal.value = sha256(form.loginPw.value);
		
		form.loginPw.value = "";
		
		form.submit();
		DoLoginForm__submited = true;
	}
	</script>
	<form class="con" action="doLogin" method="POST"
		onsubmit="DoLoginForm__submit(this); return false;">
		<input type="hidden" name="loginPwReal" />
		<input type="hidden" name="afterLoginUrl"
			value="${param.afterLoginUrl}" />
		<table>
			<colgroup>
				<col width="150">
			</colgroup>
			<tbody>
				<tr>
					<th>
						<span> 로그인아이디 </span>
					</th>
					<td>
						<div>
							<input name="loginId" type="text" maxlength="50"
								placeholder="로그인 아이디를 입력해주세요." />
						</div>
					</td>
				</tr>
				<tr>
					<th>
						<span> 로그인비밀번호 </span>
					</th>
					<td>
						<div>
							<input name="loginPw" type="password" maxlength="50"
								placeholder="로그인 비밀버호를 입력해주세요." />
						</div>
					</td>
				</tr>
				<tr>
					<th>
						<span> 로그인 </span>
					</th>
					<td>
						<div>
							<div class="btn-wrap">
								<input type="submit" value="로그인" class="btn btn-success" />
								<button type="button" onclick="history.back();"
									class="btn btn-info">뒤로가기</button>
							</div>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div><%@ include file="../../part/foot.jspf"%>