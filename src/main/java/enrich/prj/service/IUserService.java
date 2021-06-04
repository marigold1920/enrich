package enrich.prj.service;

import org.springframework.http.ResponseEntity;

import enrich.prj.entity.User;

public interface IUserService {
    ResponseEntity<?> checkLogin(User userLogin);

    ResponseEntity<?> saveUser(User userSignUp);
}
