import 'package:flutter/material.dart';
import 'package:todo_app/bloc/bloc_exports.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/widgets/bottomSheet.dart';
import 'package:todo_app/widgets/todo_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void _addToDo(BuildContext context) {
    showModalBottomSheet(
        context: context, builder: (context) => const BottomSheetContent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToDoBloc, ToDoState>(
      builder: (context, state) {
        List<ToDo> todoList = state.todoList;
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            foregroundColor: Colors.white,
            backgroundColor: Colors.deepPurpleAccent.shade700,
            title: const Text(
              'ToDo App',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Chip(label: Text('${state.todoList.length} ToDos')),
              Expanded(child: ToDoList(list: todoList)),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _addToDo(context),
            tooltip: 'Add ToDo',
            backgroundColor: Colors.deepPurpleAccent.shade700,
            child: const Icon(Icons.add, size: 30),
          ),
          drawer: SafeArea(
            child: Drawer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    color: Colors.deepPurpleAccent.shade700,
                    padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 20.0),
                    child: Text('Todo Drawer', style: Theme.of(context).textTheme.headline5,),
                  ),
                  ListTile(
                    leading: Icon(Icons.folder_special, color: Colors.deepPurpleAccent.shade700,),
                    title: const Text('Home'),
                    trailing: Text('0'),
                  ),
                  Divider(color: Colors.deepPurpleAccent.shade700),
                  ListTile(
                    leading: Icon(Icons.delete, color: Colors.deepPurpleAccent.shade700,),
                    title: const Text('Bin'),
                    trailing: Text('0'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
