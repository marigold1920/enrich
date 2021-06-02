package enrich.prj.dto.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@AllArgsConstructor
@Getter
public class MessageResponse<T> {
    private final int statusCode;
    private final String message;
    private T data;
}
