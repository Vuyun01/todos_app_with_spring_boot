package com.example.todo_app.repos;

import com.example.todo_app.models.ToDoTask;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ToDoTaskDAO extends JpaRepository<ToDoTask,Integer> {
}
