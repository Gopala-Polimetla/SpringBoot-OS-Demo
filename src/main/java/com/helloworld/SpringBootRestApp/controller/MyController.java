package com.helloworld.SpringBootRestApp.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MyController {
	
	@GetMapping(path = "/welcome")
	public String welcome() {
		return "Welcome to Hello World Spring Demo";
	}

}
