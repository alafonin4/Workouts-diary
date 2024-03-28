package ru.alafonin4.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.alafonin4.entities.Session;

public interface SessionRepository extends JpaRepository<Session, Long> {
}
