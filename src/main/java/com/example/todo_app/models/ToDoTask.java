package com.example.todo_app.models;

import jakarta.persistence.*;

import java.sql.Date;

@Entity
@Table(name = "task")
public class ToDoTask {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "task_id")
    private int id;
    @Column(name = "title")
    private String title;
    @Column(name = "sub_title")
    private String subtitle;
    @Column(name = "description")
    private String description;
    @Column(name = "create_at")
    private Date createdAt;
    @Column(name = "completed")
    private boolean completed;

    public ToDoTask(int id, String title, String subtitle, String description, Date createdAt, boolean completed) {
        this.id = id;
        this.title = title;
        this.subtitle = subtitle;
        this.description = description;
        this.createdAt = createdAt;
        this.completed = completed;
    }

    public ToDoTask() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSubtitle() {
        return subtitle;
    }

    public void setSubtitle(String subtitle) {
        this.subtitle = subtitle;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public boolean isCompleted() {
        return completed;
    }

    public void setCompleted(boolean completed) {
        this.completed = completed;
    }
}
