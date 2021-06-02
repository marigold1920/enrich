package enrich.prj.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import enrich.prj.model.AuthenticatedUserDetails;
import enrich.prj.model.User;
import enrich.prj.repository.UserRepository;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {
    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        final Optional<User> user = userRepository.findByUsername(username);

        return user.isPresent() ? AuthenticatedUserDetails.buildAthenticatedUser(user.get()) : null;
    }
}
