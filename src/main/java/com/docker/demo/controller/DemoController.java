package com.docker.demo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping(path = "demo")
@RestController
public class DemoController {

	@GetMapping(path = "greet")
	public String greet() {
		return "Welcome to Demo Application";
	}
}
