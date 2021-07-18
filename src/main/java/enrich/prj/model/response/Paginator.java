package enrich.prj.model.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Collection;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Paginator<T> {
    private int size;
    private int total;
    private int page;
    private Collection<T> results;
}
