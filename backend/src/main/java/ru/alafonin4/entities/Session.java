package ru.alafonin4.entities;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "_session")
public class Session {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "session_token", columnDefinition = "TEXT")
    private String sessionToken;

    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    private User user;
}
