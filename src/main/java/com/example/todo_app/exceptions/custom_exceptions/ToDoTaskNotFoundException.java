package com.example.todo_app.exceptions.custom_exceptions;

public class ToDoTaskNotFoundException extends RuntimeException{
    public ToDoTaskNotFoundException(String message) {
        super(message);
    }

    public ToDoTaskNotFoundException(String message, Throwable cause) {
        super(message, cause);
    }

    public ToDoTaskNotFoundException(Throwable cause) {
        super(cause);
    }
}
