package com.sbs.example.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Map;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class Util {
	public static Map getJsonMapFromFile(InputStream is) {
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			return mapper.readValue(is, Map.class);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public static String getJsonText(Object obj) {
		ObjectMapper mapper = new ObjectMapper();
		String rs = "";
		try {
			rs = mapper.writeValueAsString(obj);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return rs;
	}
}
