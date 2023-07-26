import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todos_app/models/todotask.dart';

class DetailScreen extends StatelessWidget {
  static const String routeName = '/details';
  const DetailScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final task = ModalRoute.of(context)!.settings.arguments as ToDoTask;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Screen'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TodoDetailCard(title: 'Titte', info: task.title),
              TodoDetailCard(title: 'Subtitle', info: task.subtitle!),
              TodoDetailCard(title: 'Description', info: task.description!),
              TodoDetailCard(title: 'Create at', info: DateFormat.yMMMd().format(task.createdAt)),
              TodoDetailCard(title: 'Status', info: task.completed ? 'COMPLETED' : 'INCOMPLETED'),
            ],
          ),
        ),
      ),
    );
  }
}

class TodoDetailCard extends StatelessWidget {
  const TodoDetailCard({
    super.key,
    required this.title,
    required this.info,
  });
  final String title;
  final String info;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
              text: TextSpan(
                  style: Theme.of(context).textTheme.headlineSmall,
                  text: '$title:\n',
                  children: [
                TextSpan(
                    style: Theme.of(context).textTheme.bodyLarge, text: info)
              ])),
          Divider(
            color: Theme.of(context).colorScheme.tertiary,
          )
        ],
      ),
    );
  }
}
