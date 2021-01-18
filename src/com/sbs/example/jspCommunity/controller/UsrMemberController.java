package com.sbs.example.jspCommunity.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sbs.example.jspCommunity.container.Container;
import com.sbs.example.jspCommunity.dto.Member;
import com.sbs.example.jspCommunity.service.MemberService;

public class UsrMemberController {
	private MemberService memberService;
	
	public UsrMemberController() {
		memberService = Container.memberService;
	}
	
	public String showList(HttpServletRequest req, HttpServletResponse resp) {
		List<Member> members = memberService.getForPrintMembers();
		
		req.setAttribute("members", members);
		
		return "usr/member/list";
	}
}
