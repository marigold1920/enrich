package enrich.prj.util;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

public final class PageableUtil {
    private static final int MAX_PAGE_SIZE = 50;
    private static final int MAX_PAGE_NUMBER = 1000000;

    private PageableUtil() {
    }

    private static Pageable handlePageable(Pageable pageable, int defaultPageSize) {
        var requestPageNumber = pageable.getPageNumber();
        var requestPageSize = pageable.getPageSize();

        return PageRequest.of(requestPageNumber <= MAX_PAGE_NUMBER ? requestPageNumber : 0,
            requestPageSize <= MAX_PAGE_SIZE ? requestPageSize : defaultPageSize);
    }

    public static Pageable handlePageable(Pageable pageable) {

        return handlePageable(pageable, 15);
    }
}
