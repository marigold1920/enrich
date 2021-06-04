package enrich.prj.entity;

import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Objects;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@RequiredArgsConstructor
public class AuthenticatedUserDetails implements UserDetails {
    private final String username;
    private final String password;
    private final String displayName;
    private final Collection<? extends GrantedAuthority> authorities;

    public static AuthenticatedUserDetails buildAthenticatedUser(User user) {
        final List<GrantedAuthority> authorities = Collections
                .singletonList(new SimpleGrantedAuthority(user.getRole().getCode()));

        return new AuthenticatedUserDetails(user.getUsername(), user.getPassword(), user.getDisplayName(), authorities);
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null || obj.getClass() != this.getClass())
            return false;

        AuthenticatedUserDetails user = (AuthenticatedUserDetails) obj;

        return Objects.equals(this.getUsername(), user.getUsername());
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {

        return authorities;
    }
}
