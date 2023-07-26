import 'package:flutter/material.dart';
import 'package:todos_app/apis/api_helper.dart';
import 'package:todos_app/screens/create_screen.dart';

import '../widgets/todo_card.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ApiHelper instance;

  @override
  void initState() {
    instance = ApiHelper.instance();
    super.initState();
  }

  Future<void> _refresh() async {
    setState(() {});
  }

  void showDeleteAllSheet(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Delete all tasks'),
              content: const Text('Do you really want to delete all tasks?'),
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
                    await ApiHelper.instance().deleteAll().then((value) {
                      if (value == 1) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Delete successfully')));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'Something went wrong. Failed to delete.')));
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
            )).then((value) => _refresh());
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    print('rebuild');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
        actions: [
          IconButton(
              onPressed: () {
                showDeleteAllSheet(context);
              },
              icon: const Icon(Icons.delete_outline))
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: FutureBuilder(
            future: instance.getAllTasks(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(
                  child: Text('No data available!'),
                );
              }
              return SizedBox(
                child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) => TodoCard(
                          key: ValueKey(snapshot.data![index].id),
                          task: snapshot.data![index],
                        )),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context)
            .pushNamed(CreateScreen.routeName)
            .then((value) => _refresh()),
        child: const Icon(Icons.add),
      ),
    );
  }
}
