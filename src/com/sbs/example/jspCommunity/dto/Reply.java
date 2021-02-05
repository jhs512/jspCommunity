package com.sbs.example.jspCommunity.dto;

import java.util.LinkedHashMap;
import java.util.Map;

import lombok.Data;

@Data
public class Reply {
	private int id;
	private String regDate;
	private String updateDate;
	private String relTypeCode;
	private int relId;
	private String body;
	private int memberId;

	private Map<String, Object> extra;

	private String extra__writer;
	private int extra__likePoint;
	private int extra__likeOnlyPoint;
	private int extra__dislikeOnlyPoint;

	public Reply(Map<String, Object> map) {
		this.id = (int) map.get("id");
		this.regDate = (String) map.get("regDate");
		this.updateDate = (String) map.get("updateDate");
		this.body = (String) map.get("body");
		this.memberId = (int) map.get("memberId");

		this.relTypeCode = (String) map.get("relTypeCode");
		this.relId = (int) map.get("relId");

		if (map.containsKey("extra__writer")) {
			this.extra__writer = (String) map.get("extra__writer");
		}

		if (map.containsKey("extra__likePoint")) {
			this.extra__likePoint = (int) map.get("extra__likePoint");
		}

		if (map.containsKey("extra__likeOnlyPoint")) {
			this.extra__likeOnlyPoint = (int) map.get("extra__likeOnlyPoint");
		}

		if (map.containsKey("extra__dislikeOnlyPoint")) {
			this.extra__dislikeOnlyPoint = (int) map.get("extra__dislikeOnlyPoint");
		}

		this.extra = new LinkedHashMap<>();
	}
}
