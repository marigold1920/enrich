package enrich.prj.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import enrich.prj.entity.User;
import enrich.prj.service.IUserService;
import enrich.prj.service.UserService;

@RestController
@RequestMapping("/users")
public class UserController {
    private final IUserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @PostMapping(value = "/login")
    public ResponseEntity<?> login(@RequestBody User userLogin) {

        return userService.checkLogin(userLogin);
    }

    @PostMapping(value = "/register")
    public ResponseEntity<?> signUp(@RequestBody User user) {

        return userService.saveUser(user);
    }

    @GetMapping
    @PreAuthorize("hasRole('USER')")
    public ResponseEntity<?> hello() {
        return ResponseEntity.ok("Hello World!");
    }
}
