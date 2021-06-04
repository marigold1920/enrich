package enrich.prj.service;

import java.util.Objects;
import java.util.Optional;

import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import enrich.prj.config.JwtUtil;
import enrich.prj.entity.AuthenticatedUserDetails;
import enrich.prj.entity.User;
import enrich.prj.model.response.JwtResponse;
import enrich.prj.model.response.MessageResponse;
import enrich.prj.repository.UserRepository;

@Service
public class UserService implements IUserService {
    private final AuthenticationManager authenticationManager;
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtUtil jwtUtil;

    public UserService(AuthenticationManager authenticationManager, UserRepository userRepository,
            PasswordEncoder passwordEncoder, JwtUtil jwtUtil) {
        this.authenticationManager = authenticationManager;
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
        this.jwtUtil = jwtUtil;
    }

    public ResponseEntity<?> checkLogin(User userLogin) {
        JwtResponse user = getUserFromSecurityContext(userLogin.getUsername(), userLogin.getPassword());

        if (user == null) {
            return ResponseEntity.badRequest().body("User not found!");
        }

        return ResponseEntity.ok(new MessageResponse<JwtResponse>(200, "Login successfully!", user));
    }

    public ResponseEntity<?> saveUser(User userSignUp) {
        Optional<User> user = userRepository.findByUsername(userSignUp.getUsername());

        if (user.isPresent()) {
            return ResponseEntity.badRequest().body(new MessageResponse<>(400, "Username is existed!"));
        }

        userSignUp.setPassword(passwordEncoder.encode(userSignUp.getPassword()));
        userRepository.saveAndFlush(userSignUp);

        return ResponseEntity.ok(new MessageResponse<>(200, "User registered successfully!"));
    }

    private JwtResponse getUserFromSecurityContext(String username, String password) {
        final Authentication authentication = authenticationManager
                .authenticate(new UsernamePasswordAuthenticationToken(username, password));
        SecurityContextHolder.getContext().setAuthentication(authentication);
        AuthenticatedUserDetails user = (AuthenticatedUserDetails) authentication.getPrincipal();

        if (Objects.isNull(user))
            return null;
        String jwt = jwtUtil.generateJwtToken(authentication);

        return new JwtResponse(user.getUsername(), user.getDisplayName(), jwt);
    }
}
