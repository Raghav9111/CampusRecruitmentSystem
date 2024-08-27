package com.campus.repo;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.campus.entities.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer>
{
	@Query("select u from User u where email=?1 and password=?2")
	Optional<User> findByEmailAndPassword(String email,String password);
	
	Optional<User> findByEmail(String email);
}
