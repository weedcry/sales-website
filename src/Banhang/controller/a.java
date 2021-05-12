package Banhang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/a/")
public class a {

	@RequestMapping("b")
	public String index() {
		
		return "abc";
	}
}

