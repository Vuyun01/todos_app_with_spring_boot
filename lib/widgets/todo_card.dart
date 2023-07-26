import 'package:flutter/material.dart';
import 'package:todos_app/apis/api_helper.dart';
import 'package:todos_app/constant.dart';
import 'package:todos_app/models/todotask.dart';
import 'package:todos_app/screens/detail_screen.dart';
import 'package:todos_app/screens/edit_screen.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({
    super.key,
    required this.task,
  });
  final ToDoTask task;
  void showEditPage(BuildContext context, ToDoTask task) {
    Navigator.of(context).pushNamed(EditScreen.routeName, arguments: task);
  }

  void showDeleteSheet(BuildContext context, int id) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Delete Todo Task'),
              content: const Text('Do you want to delete this task?'),
              actions: [
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: Text(
                    'Delete',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white),
                  ),
                  onPressed: () async {
                    print('deleted');
                    await ApiHelper.instance().deleteTask(id).then((value) {
                      if (value == 1) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Delete successfully')));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                                'Something went wrong. Failed to delete this task.')));
                      }
                      Navigator.of(context).pop();
                    });
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.grey),
                  child: Text('Close',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.white)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(task.title.substring(0, 1).toUpperCase()),
        ),
        onTap: () => Navigator.of(context)
            .pushNamed(DetailScreen.routeName, arguments: task),
        subtitle: Text(
          task.subtitle ?? 'N/A',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
              decorationThickness: 3,
              decoration: task.completed
                  ? TextDecoration.lineThrough
                  : TextDecoration.none),
        ),
        contentPadding: const EdgeInsets.only(left: 20),
        // horizontalTitleGap: 10,
        trailing: PopupMenuButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          itemBuilder: (context) => [
            PopupMenuItem(
                padding: const EdgeInsets.all(10),
                value: TodoMenu.edit,
                child: todoMenuButton(
                    icon: Icons.edit, label: 'Edit', color: Colors.green)),
            PopupMenuItem(
                padding: const EdgeInsets.all(10),
                value: TodoMenu.delete,
                child: todoMenuButton(
                    icon: Icons.delete, label: 'Delete', color: Colors.red)),
          ],
          onSelected: (value) {
            if (value == TodoMenu.edit) {
              showEditPage(context, task);
            } else {
              showDeleteSheet(context, task.id!);
            }
          },
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Text(
          task.title,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              decorationThickness: 2,
              decoration: task.completed
                  ? TextDecoration.lineThrough
                  : TextDecoration.none),
        ),
      ),
    );
  }
}

Widget todoMenuButton(
        {required IconData icon,
        required String label,
        required Color color}) =>
    Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            padding: const EdgeInsets.all(10),
            // margin: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: color),
            child: Icon(
              icon,
              color: Colors.white,
            )),
        const SizedBox(
          width: 10,
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 18),
        )
      ],
    );
