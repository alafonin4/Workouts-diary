package ru.alafonin4.services;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import ru.alafonin4.entities.Session;
import ru.alafonin4.pojo.AuthRequest;
import ru.alafonin4.pojo.AuthResponse;
import ru.alafonin4.repositories.SessionRepository;
import ru.alafonin4.repositories.UserRepository;

@Service
@RequiredArgsConstructor
public class SessionService {
    private final SessionRepository sessionRepository;
    private final UserRepository userRepository;

    public void save(AuthRequest request, AuthResponse response) {
        var user = userRepository.findByEmail(request.getEmail()).orElseThrow(() -> new UsernameNotFoundException("Not found user with email: " + request.getEmail()));

        Session session = Session.builder()
                .sessionToken(response.getToken())
                .user(user)
                .build();

        sessionRepository.save(session);
    }
}
