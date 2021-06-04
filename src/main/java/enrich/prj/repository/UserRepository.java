package enrich.prj.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import enrich.prj.entity.User;

public interface UserRepository extends JpaRepository<User, Integer> {
    Optional<User> findByUsername(String username);
}