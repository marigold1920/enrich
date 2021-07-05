package enrich.prj.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import enrich.prj.entity.Product;

public interface ProductRepository extends JpaRepository<Product, Integer> {
    
}
