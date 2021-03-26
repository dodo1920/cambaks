package com.cambak21.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class CommonExceptionHandle {
	private static final Logger logger = LoggerFactory.getLogger(CommonExceptionHandle.class);

	@ExceptionHandler
	public String commonError(Exception ex) {
		logger.info("삐용삐용 에러발생 : " +ex.toString());

		return "error";
	}
}
