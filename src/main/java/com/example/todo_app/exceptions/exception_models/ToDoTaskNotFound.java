package com.example.todo_app.exceptions.exception_models;

import org.springframework.http.HttpStatus;

import java.util.Date;

public class ToDoTaskNotFound {
    private String message;
    private HttpStatus status;
    private java.util.Date timestamp;

    public ToDoTaskNotFound(String message, HttpStatus status) {
        this.message = message;
        this.status = status;
        this.timestamp = new Date();
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public HttpStatus getStatus() {
        return status;
    }

    public void setStatus(HttpStatus status) {
        this.status = status;
    }

    public Date getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Date timestamp) {
        this.timestamp = timestamp;
    }
}
