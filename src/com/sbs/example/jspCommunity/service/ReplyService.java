package com.sbs.example.jspCommunity.service;

import java.util.List;
import java.util.Map;

import com.sbs.example.jspCommunity.container.Container;
import com.sbs.example.jspCommunity.dao.ReplyDao;
import com.sbs.example.jspCommunity.dto.Reply;

public class ReplyService {

	private ReplyDao replyDao;
	private MemberService memberService;

	public ReplyService() {
		replyDao = Container.replyDao;
		memberService = Container.memberService;
	}

	public int write(Map<String, Object> args) {
		return replyDao.write(args);
	}

	public List<Reply> getForPrintReplies(String relTypeCode, int relId) {
		return replyDao.getForPrintReplies(relTypeCode, relId);
	}

	public Reply getReply(int id) {
		return replyDao.getReply(id);
	}

	public boolean actorCanDelete(Reply reply, int actorId) {
		if (memberService.isAdmin(actorId)) {
			return true;
		}

		return reply.getMemberId() == actorId;
	}

	public int delete(int id) {
		return replyDao.delete(id);
	}

}
