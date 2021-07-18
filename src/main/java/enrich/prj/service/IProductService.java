package enrich.prj.service;

import enrich.prj.dto.ProductDto;
import enrich.prj.model.response.Paginator;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;

public interface IProductService {
    ResponseEntity<Paginator<ProductDto>> getProducts(Pageable pageable, String keySearch);
}
