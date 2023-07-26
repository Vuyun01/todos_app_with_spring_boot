package com.example.todo_app.services;

import com.example.todo_app.models.ToDoTask;

import java.util.List;

public interface ToDoTaskServices {
    ToDoTask findById(int id);
    List<ToDoTask> showAll();

    ToDoTask update(ToDoTask ToDoTask,int id);
    void deleteAll();
    ToDoTask deleteById(int id);

    ToDoTask add(ToDoTask ToDoTask);
}
