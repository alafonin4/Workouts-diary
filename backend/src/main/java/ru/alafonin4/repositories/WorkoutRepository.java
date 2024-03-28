package ru.alafonin4.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.alafonin4.entities.Exercise;
import ru.alafonin4.entities.Workout;

import java.util.List;
import java.util.Optional;

@Repository
public interface WorkoutRepository extends JpaRepository<Workout, Long> {
    List<Workout> findAllByUserEmailOrderByCreatedAtDesc(String email);

    Optional<Workout> findByNameAndUserEmail(String workoutName, String email);

    List<Exercise> findAllByName(String name);
}
