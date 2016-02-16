package com.codeonblue.casadocodigo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@RequestMapping("/")
	public String index(){
		System.out.println("Lógica do index");
		return "index";
	}
	
}
