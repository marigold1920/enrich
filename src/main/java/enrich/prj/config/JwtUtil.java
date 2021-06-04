package enrich.prj.config;

import java.util.Date;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;

import enrich.prj.entity.AuthenticatedUserDetails;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

@Component
public class JwtUtil {
    private static final Logger LOGGER = LogManager.getLogger(JwtUtil.class);

    @Value("${spring.security.jwtSecret}")
    private String jwtSecret;

    @Value("${spring.security.jwtExpirationMs}")
    private int jwtExpirationMs;

    public String generateJwtToken(Authentication authentication) {
        AuthenticatedUserDetails userPrincipal = (AuthenticatedUserDetails) authentication.getPrincipal();
        Date current = new Date();

        return Jwts.builder().setSubject(userPrincipal.getUsername()).setIssuedAt(current)
                .setExpiration(new Date(current.getTime() + jwtExpirationMs))
                .signWith(SignatureAlgorithm.HS512, jwtSecret).compact();
    }

    public String getUsernameFromJwtToken(String token) {

        return Jwts.parser().setSigningKey(jwtSecret).parseClaimsJws(token).getBody().getSubject();
    }

    public boolean validateJwtToken(String authToken) {
        try {
            Jwts.parser().setSigningKey(jwtSecret).parseClaimsJws(authToken);

            return true;
        } catch (Exception error) {
            LOGGER.error("Invalid JWT: ", error.getMessage());

            return false;
        }
    }
}
