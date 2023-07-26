import 'package:flutter/material.dart';
import 'package:todos_app/models/todotask.dart';

const cardBgColor = Colors.transparent;
const appBarBgColor = Color.fromARGB(255, 46, 45, 45);
const backgroundColor = Color.fromARGB(255, 23, 22, 22);
const bgColorInputField = Color.fromARGB(255, 207, 204, 204);
const iconColor = Color.fromARGB(255, 30, 182, 167);
const borderInputFieldColor = Color.fromARGB(255, 47, 206, 190);

enum TodoMenu{
  edit,
  delete
}
final demo_tasks = [
  ToDoTask(
      id: 1,
      title: 'Playing game',
      subtitle: 'Play game with John',
      description: 'this is test description',
      createdAt: DateTime.now(),
      completed: false),
  ToDoTask(
      id: 2,
      title: 'Doing homework',
      subtitle: 'Doing homework by 11pm',
      description: 'this is test description',
      createdAt: DateTime.now(),
      completed: true),
  ToDoTask(
      id: 3,
      title: 'Watch movies',
      subtitle: 'watch movies at 10pm',
      description: 'this is test description',
      createdAt: DateTime.now(),
      completed: false),
  ToDoTask(
      id: 1,
      title: 'Go Paris',
      subtitle: 'Go Paris in 2024',
      description: 'this is test description',
      createdAt: DateTime.now(),
      completed: false),
];
