package ru.alafonin4.exceptions;

public class NotFoundWorkoutException extends RuntimeException{
    public NotFoundWorkoutException(String message){
        super(message);
    }
}

