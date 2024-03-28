package ru.alafonin4.exceptions;

public class NotFoundEmailException extends RuntimeException{
    public NotFoundEmailException(String message){
        super(message);
    }
}
