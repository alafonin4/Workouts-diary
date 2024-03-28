package ru.alafonin4.controllers;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import ru.alafonin4.exceptions.NotFoundEmailException;
import ru.alafonin4.pojo.AuthResponse;
import ru.alafonin4.pojo.LoginRequest;
import ru.alafonin4.pojo.RegisterRequest;
import ru.alafonin4.services.AuthService;
import ru.alafonin4.services.SessionService;

@RestController
@RequestMapping("/auth")
@RequiredArgsConstructor
public class AuthController {

    private final AuthService authService;
    private final SessionService sessionService;

    @CrossOrigin(origins = "http://localhost:3001")
    @PostMapping("/register")
    public ResponseEntity<AuthResponse> register(@Valid @RequestBody RegisterRequest request) {


        var response = authService.register(request);
        sessionService.save(request, response);

        return ResponseEntity.ok()
                .body(response);
    }

    // Обработка предварительного запроса OPTIONS
    @CrossOrigin(origins = "http://localhost:3001", methods = {RequestMethod.OPTIONS})
    @RequestMapping(value = "/register", method = RequestMethod.OPTIONS)
    public ResponseEntity<?> handleRegisterOptionsRequest() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Access-Control-Allow-Origin", "http://localhost:3001");
        return ResponseEntity.ok().headers(headers).build();
    }

    @CrossOrigin(origins = "http://localhost:3001")
    @PostMapping("/login")
    public ResponseEntity<?> login(@Valid @RequestBody LoginRequest request) {
        AuthResponse response;
        try {
            response  = authService.login(request);
            sessionService.save(request, response);
            return ResponseEntity.ok(response);
        } catch (NotFoundEmailException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }
    // Обработка предварительного запроса OPTIONS
    @CrossOrigin(origins = "http://localhost:3001", methods = {RequestMethod.OPTIONS})
    @RequestMapping(value = "/login", method = RequestMethod.OPTIONS)
    public ResponseEntity<?> handleLogInOptionsRequest() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Access-Control-Allow-Origin", "http://localhost:3001");
        return ResponseEntity.ok().headers(headers).build();
    }
}
