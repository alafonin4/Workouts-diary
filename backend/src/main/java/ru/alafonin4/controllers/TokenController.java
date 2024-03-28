package ru.alafonin4.controllers;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import ru.alafonin4.exceptions.InvalidTokenException;
import ru.alafonin4.pojo.UserInfoResponse;
import ru.alafonin4.services.JwtService;
import ru.alafonin4.services.UserService;

@RestController
@RequestMapping("/token")
@RequiredArgsConstructor
public class TokenController {
    private final JwtService jwtService;
    private final UserService userService;

    @GetMapping("/validate")
    public ResponseEntity<Boolean> validateToken(@RequestHeader(HttpHeaders.AUTHORIZATION) String authToken) {
        boolean isValid = jwtService.isValidToken(authToken);
        return ResponseEntity.ok(isValid);
    }

    @GetMapping("/user-info")
    public ResponseEntity<UserInfoResponse> userInfo(@RequestHeader(HttpHeaders.AUTHORIZATION) String authToken) {
        if (!jwtService.isValidToken(authToken)) {
            throw new InvalidTokenException("Invalid token.");
        }
        String email = jwtService.extractEmail(authToken.substring(7));
        return ResponseEntity.ok(userService.getUserInfoByEmail(email));
    }
}
