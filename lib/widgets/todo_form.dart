import 'package:flutter/material.dart';
import '../apis/api_helper.dart';
import 'package:todos_app/models/todotask.dart';

class TodoForm extends StatefulWidget {
  const TodoForm({super.key, this.isCreated = true, this.task});
  final bool isCreated;
  final ToDoTask? task;
  @override
  State<TodoForm> createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  final _formKey = GlobalKey<FormState>();

  final task = ToDoTask(
      title: '',
      subtitle: '',
      description: '',
      createdAt: DateTime.now(),
      completed: false);
  late final ApiHelper instance;
  @override
  void initState() {
    instance = ApiHelper.instance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            onSaved: (value) {
              task.title = value!;
            },
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
                labelText: 'Title', hintText: 'Enter a title'),
            initialValue: widget.task?.title ?? '',
            validator: (value) {
              if (value!.isEmpty) {
                return 'Title is required field';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            onSaved: (value) {
              task.subtitle = value!;
            },
            textInputAction: TextInputAction.next,
            initialValue: widget.task?.subtitle ?? '',
            decoration: const InputDecoration(
              hintText: 'Enter a subtitle',
              labelText: 'Subtitle',
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            onSaved: (value) {
              task.description = value!;
            },
            keyboardType: TextInputType.multiline,
            maxLines: 3,
            maxLength: 200,
            textInputAction: TextInputAction.done,
            initialValue: widget.task?.description ?? '',
            decoration: const InputDecoration(
              labelText: 'Description',
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                'Completed: ',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                width: 10,
              ),
              Checkbox(
                  value: widget.task?.completed ?? task.completed,
                  onChanged: widget.task == null
                      ? null
                      : (value) {
                          // print(widget.task!.completed);
                          setState(() {
                            widget.task!.completed = value!;
                          });
                        })
            ],
          ),
          const SizedBox(height: 30),
          TextButton(
            style: TextButton.styleFrom(
                minimumSize: const Size(300, 60),
                padding: const EdgeInsets.symmetric(vertical: 10),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    side: BorderSide(color: Colors.blueGrey, width: 3))),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // All fields are valid, submit the form
                final todoTask = ToDoTask(
                    id: widget.task?.id,
                    title: task.title,
                    subtitle: task.subtitle,
                    description: task.description,
                    createdAt: widget.task?.createdAt ?? task.createdAt,
                    completed: widget.task?.completed ?? task.completed);
                _submitForm(todoTask);
              }
            },
            child: Text(
              'Submit',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }

  void _submitForm(ToDoTask new_task) async {
    // Process the form data
    if (widget.isCreated) {
      await instance.addTask(new_task).then((value) {
        if (value == 1) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Added task successfully')));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Something wen wrong. Failed to add task!')));
        }
      });
    } else {
      await instance.updateTask(new_task, new_task.id!).then((value) {
        if (value == 1) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Updated task successfully')));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Something wen wrong. Failed to update task!')));
        }
        Navigator.of(context).pop();
      });
    }
    // Reset the form after submission
    _formKey.currentState!.reset();
  }
}
