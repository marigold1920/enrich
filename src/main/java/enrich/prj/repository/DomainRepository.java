package enrich.prj.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import enrich.prj.entity.Domain;

public interface DomainRepository extends JpaRepository<Domain, Integer> {
    
}
