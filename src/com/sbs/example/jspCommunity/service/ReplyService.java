package com.sbs.example.jspCommunity.service;

import java.util.Map;

import com.sbs.example.jspCommunity.container.Container;
import com.sbs.example.jspCommunity.dao.ReplyDao;

public class ReplyService {

	private ReplyDao replyDao;

	public ReplyService() {
		replyDao = Container.replyDao;
	}

	public int write(Map<String, Object> args) {
		return replyDao.write(args);
	}

}
