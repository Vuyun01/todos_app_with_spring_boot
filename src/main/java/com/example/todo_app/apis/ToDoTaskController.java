package com.example.todo_app.apis;

import com.example.todo_app.models.ToDoTask;
import com.example.todo_app.services.ToDoTaskServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping(path = "api/v1/tasks")
public class ToDoTaskController {

    private ToDoTaskServices toDoTaskServices;
    @Autowired
    public ToDoTaskController(ToDoTaskServices toDoTaskServices) {
        this.toDoTaskServices = toDoTaskServices;
    }

    @GetMapping(path = "{id}")
    public ToDoTask findById(@PathVariable int id){
        return toDoTaskServices.findById(id);
    }

    @GetMapping
    public List<ToDoTask> showAll(){
        return toDoTaskServices.showAll();
    }

    @PutMapping(path = "{id}")
    public ToDoTask update(@PathVariable("id") int id, @RequestBody ToDoTask toDoTask){
        return toDoTaskServices.update(toDoTask, id);
    }
    @DeleteMapping
    public void deleteAll(){
        toDoTaskServices.deleteAll();
    }
    @DeleteMapping(path = "{id}")
    public ToDoTask deleteById(@PathVariable("id") int id){
        return toDoTaskServices.deleteById(id);
    }
    @PostMapping
    public ToDoTask add(@RequestBody ToDoTask toDoTask){
        return toDoTaskServices.add(toDoTask);
    }


}
