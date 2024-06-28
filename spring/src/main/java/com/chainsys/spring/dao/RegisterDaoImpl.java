package com.chainsys.spring.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.chainsys.spring.mapper.RegisterRowMapper;
import com.chainsys.spring.model.Register;

@Repository
public class RegisterDaoImpl implements RegisterDAO{
  
	@Autowired
    JdbcTemplate jdbcTemplate;
  
	@Autowired
	RegisterRowMapper rowMapper;
	
	
	public void save(Register register)  {
		// TODO Auto-generated method stub
		String query="insert into users(username,password,email,contact_no) values (?,?,?,?)";
		Object[] params= {register.getUsername(),register.getPassword(),register.getEmail(),register.getContactno()};
		int rows=jdbcTemplate.update(query, params);
		System.out.println("Inserted rows:"+ rows);
	}

	@Override
	public List<Register> getUsers() {
		// TODO Auto-generated method stub
		String query="select user_id,username,password,email,contact_no from users";
		return jdbcTemplate.query(query,rowMapper);
	}

	public int update(Register register) {
		// TODO Auto-generated method stub
		String query="update users set username=?,password=?,email=?,contact_no=? where user_id=?";
		Object[] params= {register.getUsername(),register.getPassword(),register.getEmail(),register.getContactno(),register.getUserId() };
		int rows=jdbcTemplate.update(query, params);
		System.out.println("Updated rows:"+ rows);
		return rows;
	}

	public void deleteUser(int userId) {
		String query="delete from users where user_id=?";
		Object[] parems= {userId};
		jdbcTemplate.update(query, parems);
		
	}
	
	public List<Register> searchUser(String username) {
		String query="select user_id,username,password,email,contact_no from users where username LIKE ?";
		Object[] param= {username};
		return jdbcTemplate.query(query,param,rowMapper);
	}
	
	public List<Register> getUpdate(int userId) {
		String query="select user_id,username,password,email,contact_no from users where user_id=?";
		Object[] param= {userId};
		return jdbcTemplate.query(query,param,rowMapper);		
	}
	
	
	
	
	
	
	
	
	
	

	

	}
	

	

	


