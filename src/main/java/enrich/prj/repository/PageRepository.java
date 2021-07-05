package enrich.prj.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import enrich.prj.entity.Page;

public interface PageRepository extends JpaRepository<Page, Integer> {
    
}
