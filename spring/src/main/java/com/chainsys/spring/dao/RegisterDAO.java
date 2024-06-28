package com.chainsys.spring.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.chainsys.spring.model.Register;

@Repository
public interface RegisterDAO {
	
	public void save(Register register);
	public List<Register> getUsers();
	public void deleteUser(int userId);
	public int update(Register register);
	public List<Register> searchUser(String username);
	public List<Register> getUpdate(int userId);
}
