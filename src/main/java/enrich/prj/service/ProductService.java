package enrich.prj.service;

import enrich.prj.dto.DomainDto;
import enrich.prj.dto.ProductDto;
import enrich.prj.entity.Product;
import enrich.prj.model.response.Paginator;
import enrich.prj.repository.ProductRepository;
import org.modelmapper.ModelMapper;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.stream.Collectors;

@Service
public class ProductService implements IProductService {

    private final ProductRepository productRepository;
    private final ModelMapper modelMapper;

    public ProductService(ProductRepository productRepository, ModelMapper modelMapper) {
        this.productRepository = productRepository;
        this.modelMapper = modelMapper;
    }

    @Override
    public ResponseEntity<Paginator<ProductDto>> getProducts(Pageable pageable, String keySearch) {
        var results = productRepository.getProducts(keySearch, pageable);
        var paginator = new Paginator<>(results.getSize(), results.getTotalPages(), results.getNumber(),
            results.getContent().stream()
                .map(this::convertToProductDto)
                .collect(Collectors.toList())
        );

        return ResponseEntity.ok(paginator);
    }

    private ProductDto convertToProductDto(Product product) {
        var productDto = modelMapper.map(product, ProductDto.class);
        var domainDto = modelMapper.map(product.getDomain(), DomainDto.class);
        productDto.setDomain(domainDto);

        return productDto;
    }
}
