package com.tianfu.onlineteaching.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/Test")
public class TestController {
	@RequestMapping("/findAll")
	public String findAll() {
		System.out.println("����һ������");
		return "article";
	}
}
