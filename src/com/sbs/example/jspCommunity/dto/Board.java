package com.sbs.example.jspCommunity.dto;

import java.util.Map;

public class Board {
	public int id;
	public String regDate;
	public String updateDate;
	public String code;
	public String name;

	public Board(Map<String, Object> map) {
		this.id = (int) map.get("id");
		this.regDate = (String) map.get("regDate");
		this.updateDate = (String) map.get("updateDate");
		this.code = (String) map.get("code");
		this.name = (String) map.get("name");

	}

	@Override
	public String toString() {
		return "Board [id=" + id + ", regDate=" + regDate + ", updateDate=" + updateDate + ", code=" + code + ", name=" + name + "]";
	}
}
