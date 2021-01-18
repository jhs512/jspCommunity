package com.sbs.example.jspCommunity.container;

import com.sbs.example.jspCommunity.controller.usr.ArticleController;
import com.sbs.example.jspCommunity.controller.usr.MemberController;
import com.sbs.example.jspCommunity.dao.ArticleDao;
import com.sbs.example.jspCommunity.dao.MemberDao;
import com.sbs.example.jspCommunity.service.ArticleService;
import com.sbs.example.jspCommunity.service.MemberService;

public class Container {
	public static ArticleService articleService;
	public static ArticleDao articleDao;
	public static ArticleController articleController;
	
	public static MemberDao memberDao;
	public static MemberService memberService;
	public static MemberController memberController;
	public static com.sbs.example.jspCommunity.controller.adm.MemberController admMemberController;
	
	static {
		memberDao = new MemberDao();
		articleDao = new ArticleDao();
		
		memberService = new MemberService();
		articleService = new ArticleService();
		
		admMemberController = new com.sbs.example.jspCommunity.controller.adm.MemberController();
		memberController = new MemberController();
		articleController = new ArticleController();
	}
}
