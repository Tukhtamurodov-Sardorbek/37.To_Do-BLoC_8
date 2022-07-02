import 'package:flutter/material.dart';
import 'package:todo_app/bloc/bloc_exports.dart';
import 'package:todo_app/pages/home_page.dart';
import 'package:todo_app/pages/recycle_bin.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.deepPurpleAccent.shade700,
              padding:
                  const EdgeInsets.symmetric(vertical: 14.0, horizontal: 20.0),
              child: Text(
                'Todo Drawer',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            BlocBuilder<ToDoBloc, ToDoState>(
              builder: (context, state) {
                return ListTile(
                  leading: Icon(
                    Icons.folder_special,
                    color: Colors.deepPurpleAccent.shade700,
                  ),
                  title: const Text('Home'),
                  trailing: Text('${state.todoList.length}'),
                  onTap: () => Navigator.pushNamed(context, HomePage.id),
                );
              },
            ),
            Divider(color: Colors.deepPurpleAccent.shade700),
            BlocBuilder<ToDoBloc, ToDoState>(
              builder: (context, state) {
                return ListTile(
                  leading: Icon(
                    Icons.delete,
                    color: Colors.deepPurpleAccent.shade700,
                  ),
                  title: const Text('Bin'),
                  trailing: Text('${state.deletedList.length}'),
                  onTap: () => Navigator.pushNamed(context, RecycleBin.id),
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}
