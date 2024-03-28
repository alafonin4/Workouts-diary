package ru.alafonin4.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.alafonin4.entities.User;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByEmail(String email);
}
