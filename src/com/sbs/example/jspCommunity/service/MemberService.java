package com.sbs.example.jspCommunity.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sbs.example.jspCommunity.App;
import com.sbs.example.jspCommunity.container.Container;
import com.sbs.example.jspCommunity.dao.MemberDao;
import com.sbs.example.jspCommunity.dto.Member;
import com.sbs.example.util.Util;

public class MemberService {

	private MemberDao memberDao;
	private EmailService emailService;
	
	public MemberService() {
		memberDao = Container.memberDao;
		emailService = Container.emailService;
	}

	public List<Member> getForPrintMembers() {
		return memberDao.getForPrintMembers();
	}

	public int join(Map<String, Object> args) {
		return memberDao.join(args);
	}

	public Member getMemberByLoginId(String loginId) {
		return memberDao.getMemberByLoginId(loginId);
	}

	public Member getMemberById(int id) {
		return memberDao.getMemberById(id);
	}

	public Member getMemberByNameAndEmail(String name, String email) {
		return memberDao.getMemberByNameAndEmail(name, email);
	}

	public Map<String, Object> sendTempLoginPwToEmail(Member actor) {
		// 메일 제목과 내용 만들기
		String siteName = App.getSite();
		String siteLoginUrl = App.getLoginUrl();
		String title = "[" + siteName + "] 임시 패스워드 발송";
		String tempPassword = Util.getTempPassword(6);
		String body = "<h1>임시 패스워드 : " + tempPassword + "</h1>";
		body += "<a href=\"" + siteLoginUrl + "\" target=\"_blank\">로그인 하러가기</a>";
		
		Map<String, Object> rs = new HashMap<>();

		// 메일 발송
		int sendRs = emailService.send(actor.getEmail(), title, body);
		
		if ( sendRs == 1 ) {
			rs.put("resultCode", "S-1");
			rs.put("msg", String.format("고객님의 새 임시 패스워드가 %s (으)로 발송되었습니다.", actor.getEmail()));
			
			// 고객의 패스워드를 방금 생성한 임시패스워드로 변경
			setTempPassword(actor, tempPassword);			
		}
		else {
			rs.put("resultCode", "F-1");
			rs.put("msg", "메일발송에 실패하였습니다.");
		}
		
		return rs;
	}

	private void setTempPassword(Member actor, String tempPassword) {
		Map<String, Object> modifyParam = new HashMap<>();
		modifyParam.put("id", actor.getId());
		modifyParam.put("loginPw", Util.sha256(tempPassword));
		modify(modifyParam);
	}

	private void modify(Map<String, Object> param) {
		memberDao.modify(param);
	}

}
