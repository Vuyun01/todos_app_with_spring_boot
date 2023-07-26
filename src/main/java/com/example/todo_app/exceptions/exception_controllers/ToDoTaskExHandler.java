package com.example.todo_app.exceptions.exception_controllers;

import com.example.todo_app.exceptions.custom_exceptions.ToDoTaskNotFoundException;
import com.example.todo_app.exceptions.exception_models.ToDoTaskNotFound;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import java.sql.Date;

@ControllerAdvice
public class ToDoTaskExHandler {
    @ExceptionHandler
    public ResponseEntity<ToDoTaskNotFound> handlingToDoTaskNotFoundEx(ToDoTaskNotFoundException ex){
        ToDoTaskNotFound notFound = new ToDoTaskNotFound(
                ex.getMessage(),
                HttpStatus.NOT_FOUND
        );
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(notFound);
    }

//    @ExceptionHandler
//    public ResponseEntity<ToDoTaskNotFound> handlingToDoTaskGeneralEx(RuntimeException ex){
//        ToDoTaskNotFound notFound = new ToDoTaskNotFound(
//                ex.getMessage(),
//                HttpStatus.BAD_REQUEST
//        );
//        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(notFound);
//    }
}
