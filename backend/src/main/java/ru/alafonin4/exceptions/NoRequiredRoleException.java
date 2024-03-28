package ru.alafonin4.exceptions;

public class NoRequiredRoleException extends RuntimeException {
    public NoRequiredRoleException(String message) {
        super(message);
    }
}
