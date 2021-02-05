package com.sbs.example.jspCommunity.dto;

import java.util.LinkedHashMap;
import java.util.Map;

import lombok.Data;

@Data
public class Article {
	private int id;
	private String regDate;
	private String updateDate;
	private String title;
	private String body;
	private int memberId;
	private int boardId;
	private int hitsCount;

	private Map<String, Object> extra;

	private String extra__writer;
	private String extra__boardName;
	private String extra__boardCode;
	private int extra__likePoint;
	private int extra__likeOnlyPoint;
	private int extra__dislikeOnlyPoint;

	public Article(Map<String, Object> map) {
		this.id = (int) map.get("id");
		this.regDate = (String) map.get("regDate");
		this.updateDate = (String) map.get("updateDate");
		this.title = (String) map.get("title");
		this.body = (String) map.get("body");
		this.memberId = (int) map.get("memberId");
		this.boardId = (int) map.get("boardId");
		this.hitsCount = (int) map.get("hitsCount");

		if (map.containsKey("extra__writer")) {
			this.extra__writer = (String) map.get("extra__writer");
		}

		if (map.containsKey("extra__boardName")) {
			this.extra__boardName = (String) map.get("extra__boardName");
		}

		if (map.containsKey("extra__boardCode")) {
			this.extra__boardCode = (String) map.get("extra__boardCode");
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
