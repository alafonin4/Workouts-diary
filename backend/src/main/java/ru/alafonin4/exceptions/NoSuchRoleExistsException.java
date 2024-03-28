package ru.alafonin4.exceptions;

public class NoSuchRoleExistsException extends RuntimeException{
    public NoSuchRoleExistsException(String message){
        super(message);
    }
}
