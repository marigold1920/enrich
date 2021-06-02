package enrich.prj.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Getter
@Builder
@AllArgsConstructor
public class JwtResponse {
    private String username;
    private String displayName;
    private String token;
    private final String type = "Bearer";
}
