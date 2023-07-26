import 'package:flutter/material.dart';
import 'package:todos_app/models/todotask.dart';
import 'package:todos_app/widgets/todo_form.dart';

class EditScreen extends StatelessWidget {
  static const String routeName = '/edit';
  const EditScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final task = ModalRoute.of(context)?.settings.arguments as ToDoTask;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Screen'),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: TodoForm(
              task: task,
              isCreated: false,
            )),
      ),
    );
  }
}
