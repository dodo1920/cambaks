package com.cambak21.controller.boards;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cambak21.service.boardCS.BoardCsService;

@Controller("/board/cs/*")
public class BoardCsController {
	
	@Inject
	private BoardCsService service;
	
	@RequestMapping("/")
	public String BoardCsList() {
		return null;
	}
	
}
