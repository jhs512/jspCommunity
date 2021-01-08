package com.sbs.example.jspCommunity.dto;

import java.util.Map;

public class Member {
	public int id;
	public String regDate;
	public String updateDate;
	public String loginId;
	public String loginPw;
	public String name;
	public String nickname;
	public String email;
	public String cellphoneNo;
	public int authLevel;

	public Member(Map<String, Object> map) {
		this.id = (int) map.get("id");
		this.regDate = (String) map.get("regDate");
		this.updateDate = (String) map.get("updateDate");
		this.loginId = (String) map.get("loginId");
		this.loginPw = (String) map.get("loginPw");
		this.name = (String) map.get("name");
		this.nickname = (String) map.get("nickname");
		this.email = (String) map.get("email");
		this.cellphoneNo = (String) map.get("cellphoneNo");
		this.authLevel = (int) map.get("authLevel");
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", regDate=" + regDate + ", updateDate=" + updateDate + ", loginId=" + loginId + ", loginPw=" + loginPw + ", name=" + name + ", nickname=" + nickname + ", email=" + email + ", cellphoneNo=" + cellphoneNo
				+ ", authLevel=" + authLevel + "]";
	}

}
