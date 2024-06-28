package com.chainsys.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chainsys.spring.dao.RegisterDAO;
import com.chainsys.spring.model.Register;


@Controller
public class MyController {
	
	@Autowired
	RegisterDAO registerDao;
	
	@Autowired
	JdbcTemplate jdbcTemplate;

	@RequestMapping("/")
	public String welcome() {
		return "register.jsp";

	}

	
  @PostMapping("/register")
   public String register(@RequestParam("username") String username,@RequestParam("password") String password,@RequestParam("email") String email,@RequestParam("contact no") String contactno,Model model )
   {
	 Register register=new Register();
	 
	 register.setUsername(username);
	 register.setPassword(password);
	 register.setEmail(email);
	 register.setContactno(contactno);
	 System.out.println(register.getUsername()+register.getPassword()+register.getEmail()+register.getContactno());
	 registerDao.save(register);
	 List<Register> users= registerDao.getUsers();
	 model.addAttribute("users", users);
	 return "listofUser.jsp";
	  	   
   }
  
  @PostMapping("/update")
   public String updateUser(@RequestParam("username") String username,@RequestParam("password") String password,@RequestParam("email") String email,@RequestParam("contact no") String contactno,@RequestParam("userid") int userId,Model model )
   {
	    Register register=new Register();
	    register.setUsername(username);
		register.setPassword(password);
	    register.setEmail(email);
	    register.setContactno(contactno);
	    register.setUserId(userId);
	    registerDao.update(register);
		List<Register> users = registerDao.getUsers();
		model.addAttribute("users",users);
		return "listofUser.jsp";	
	   
   }
  
  @PostMapping("/delete")
  public String Delete(@RequestParam("userId") int userId,Model model) {
		registerDao.deleteUser(userId);
		List<Register> register = registerDao.getUsers();
		model.addAttribute("users",register);
		return "listofUser.jsp";		
	}
  
  @PostMapping("/search")
	public String search(@RequestParam("username") String username,Model model) {
		List<Register>  register = registerDao.searchUser(username);
		model.addAttribute("users",register);
		return "listofUser.jsp";	
	}
  
  @PostMapping("/getupdate")
	public String allUpadte(@RequestParam("userid") int userId,Model model) {
		List<Register>  register=registerDao.getUpdate(userId);
		model.addAttribute("users",register);
		return "update.jsp";		
	}
}
