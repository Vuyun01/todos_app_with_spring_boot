package com.example.todo_app.services;

import com.example.todo_app.exceptions.custom_exceptions.ToDoTaskNotFoundException;
import com.example.todo_app.models.ToDoTask;
import com.example.todo_app.repos.ToDoTaskDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ToDoTaskImpl implements ToDoTaskServices{

    private ToDoTaskDAO toDoTaskDAO;
    @Autowired
    public ToDoTaskImpl(ToDoTaskDAO toDoTaskDAO) {
        this.toDoTaskDAO = toDoTaskDAO;
    }

    public ToDoTask findById(int id) {
        Optional<ToDoTask> toDoTask = toDoTaskDAO.findById(id);
        if(toDoTask.isPresent()){
            return toDoTask.get();
        }else{
            throw new ToDoTaskNotFoundException("No result found for task " + id);
        }
    }

    @Override
    public List<ToDoTask> showAll() {
        return toDoTaskDAO.findAll();
    }

    @Override
    public ToDoTask update(ToDoTask toDoTask,int id) {
        Optional<ToDoTask> check = toDoTaskDAO.findById(id);
        if(check.isPresent()){
            ToDoTask newTask = new ToDoTask(
                    check.get().getId(),
                    toDoTask.getTitle(),
                    toDoTask.getSubtitle(),
                    toDoTask.getDescription(),
                    toDoTask.getCreatedAt(),
                    toDoTask.isCompleted()
            );
            toDoTaskDAO.save(newTask);
            return newTask;
        }else{
            throw new RuntimeException("Unable to update this record");
        }

    }

    @Override
    public void deleteAll() {
        toDoTaskDAO.deleteAll();
    }

    @Override
    public ToDoTask deleteById(int id) {
        Optional<ToDoTask> toDoTask = toDoTaskDAO.findById(id);
        if(toDoTask.isPresent()){
            toDoTaskDAO.delete(toDoTask.get());
            return toDoTask.get();
        }else{
            throw new RuntimeException("Unable to delete this record");
        }
    }

    @Override
    public ToDoTask add(ToDoTask toDoTask) {
        return toDoTaskDAO.save(toDoTask);
    }
}
