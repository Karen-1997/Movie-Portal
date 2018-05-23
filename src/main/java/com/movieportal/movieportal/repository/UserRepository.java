package com.movieportal.movieportal.repository;


import com.movieportal.movieportal.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Integer> {

    User findOneByEmail(String email);
}
