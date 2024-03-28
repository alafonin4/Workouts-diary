package ru.alafonin4.services;

import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import ru.alafonin4.entities.User;
import ru.alafonin4.enums.UserRole;
import ru.alafonin4.exceptions.NotFoundEmailException;
import ru.alafonin4.exceptions.UserAlreadyExistException;
import ru.alafonin4.pojo.AuthResponse;
import ru.alafonin4.pojo.LoginRequest;
import ru.alafonin4.pojo.RegisterRequest;
import ru.alafonin4.repositories.UserRepository;

import java.time.LocalDateTime;

@Service
@RequiredArgsConstructor
public class AuthService {

    private final UserRepository repository;
    private final PasswordEncoder passwordEncoder;
    private final JwtService jwtService;
    private final AuthenticationManager manager;

    public AuthResponse register(RegisterRequest request) {

        if (!repository.findByEmail(request.getEmail()).isEmpty()) {
            throw new UserAlreadyExistException("User already exists.");
        }


        var user = User.builder()
                .email(request.getEmail())
                .passwordHash(passwordEncoder.encode(request.getPassword()))
                .role(UserRole.CUSTOMER)
                .createdAt(LocalDateTime.now())
                .build();

        repository.save(user);

        var jwtToken = jwtService.generateToken(user);

        return AuthResponse.builder()
                .token(jwtToken)
                .build();
    }

    public AuthResponse login(LoginRequest request) {
        var user = repository.findByEmail(request.getEmail());
        if (user.isEmpty()){
            throw new NotFoundEmailException("User with this email was not found.");
        }
        if (passwordEncoder.encode(request.getPassword()).equals(user.get().getPassword())) {
            throw new NotFoundEmailException("");
        }
        manager.authenticate(new UsernamePasswordAuthenticationToken(
                        request.getEmail(),
                        request.getPassword()
                )
        );

        var jwtToken = jwtService.generateToken(user.get());



        return AuthResponse.builder()
                .token(jwtToken)
                .build();
    }
}
