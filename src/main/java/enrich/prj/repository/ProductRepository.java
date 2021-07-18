package enrich.prj.repository;

import enrich.prj.entity.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ProductRepository extends JpaRepository<Product, Integer> {

    @Query(value = "SELECT p FROM Product p WHERE p.name LIKE %:keySearch%",
        countQuery = "SELECT COUNT(p.productId) FROM Product p WHERE p.name LIKE %:keySearch%")
    Page<Product> getProducts(@Param("keySearch") String keySearch, Pageable pageable);
}
