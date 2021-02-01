package com.sbs.example.jspCommunity.controller;

import javax.servlet.http.HttpServletRequest;

import com.sbs.example.jspCommunity.dto.ResultData;

public class Controller {
	protected String msgAndBack(HttpServletRequest req, String msg) {
		req.setAttribute("alertMsg", msg);
		req.setAttribute("historyBack", true);
		return "common/redirect";
	}

	protected String msgAndReplace(HttpServletRequest req, String msg, String replaceUrl) {
		req.setAttribute("alertMsg", msg);
		req.setAttribute("replaceUrl", replaceUrl);
		return "common/redirect";
	}
	
	protected String json(HttpServletRequest req, ResultData resultData) {
		req.setAttribute("data", resultData);
		return "common/json";
	}
}
