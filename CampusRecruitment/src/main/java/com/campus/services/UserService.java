package com.campus.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.campus.entities.User;
import com.campus.repo.UserRepository;

@Service
public class UserService implements UserDetailsService{
	@Autowired
	private UserRepository userRepo;
	 
	public User getByID(int id) {
		return userRepo.findById(id).get();
	}
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserDetails user = userRepo.findByEmail(username).get();
		return user;
	}

	public User saveUser(String email, String password, String role)
	{
		User user = new User(email, password, role);
		return userRepo.save(user);
	}

}
