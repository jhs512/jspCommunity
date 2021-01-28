package com.sbs.example.jspCommunity.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sbs.example.jspCommunity.container.Container;

public class UsrHomeController {
	public String showMain(HttpServletRequest req, HttpServletResponse resp) {
		Container.attrService.setValue("member__1__extra__isUsingTempPassword", "17", null);
		Container.attrService.remove("member__1__extra__isUsingTempPassword");
		String value = Container.attrService.getValue("member__1__extra__isUsingTempPassword");
		
		req.setAttribute("data", value);
		
		return "common/pure";
	}
}
