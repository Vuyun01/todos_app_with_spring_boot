import 'package:flutter/material.dart';

import '../widgets/todo_form.dart';

class CreateScreen extends StatefulWidget {
  static const String routeName = '/create';
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Screen'),
      ),
      body: const SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: TodoForm()),
      ),
    );
  }
}
