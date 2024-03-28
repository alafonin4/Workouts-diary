package ru.alafonin4.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.alafonin4.entities.Exercise;

import java.util.List;

public interface ExerciseRepository extends JpaRepository<Exercise, Long> {
    List<Exercise> findAllByWorkout_Id(Long id);
}
