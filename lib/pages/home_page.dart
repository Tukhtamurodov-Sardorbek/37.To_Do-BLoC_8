import 'package:flutter/material.dart';
import 'package:todo_app/bloc/bloc_exports.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/services/guid_gen.dart';
import 'package:todo_app/widgets/bottomSheet.dart';
import 'package:todo_app/widgets/todo_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void _addToDo(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => const BottomSheetContent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToDoBloc, ToDoState>(builder: (context, state) {
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
        body: ToDoList(list: todoList),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _addToDo(context),
          tooltip: 'Add ToDo',
          backgroundColor: Colors.deepPurpleAccent.shade700,
          child: const Icon(Icons.add, size: 30),
        ),
      );
    });
  }
}