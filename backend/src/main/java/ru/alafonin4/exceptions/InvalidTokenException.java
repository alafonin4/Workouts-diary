package ru.alafonin4.exceptions;

public class InvalidTokenException extends RuntimeException{
    public InvalidTokenException(String message){
        super(message);
    }
}
