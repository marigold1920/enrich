package enrich.prj.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import enrich.prj.model.Role;

public interface RoleRepository extends JpaRepository<Role, String> {

}
