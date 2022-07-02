import 'package:flutter/material.dart';
import 'package:todo_app/bloc/bloc_exports.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/services/color_service.dart';
import 'package:todo_app/widgets/bottomSheet.dart';
import 'package:todo_app/widgets/drawer.dart';
import 'package:todo_app/widgets/todo_list.dart';

class HomePage extends StatelessWidget {
  static const String id = '/home';
  const HomePage({Key? key}) : super(key: key);

  void _addToDo(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => const BottomSheetContent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToDoBloc, ToDoState>(
      builder: (context, state) {
        List<ToDo> todoList = state.todoList;
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            foregroundColor: ColorService.white,
            backgroundColor: ColorService.main,
            title: const Text(
              'ToDo App',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Chip(
                label: Text(
                  '${state.todoList.length} ToDos',
                  style: const TextStyle(
                    color: ColorService.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                backgroundColor: ColorService.main,
              ),
              Expanded(child: ToDoList(list: todoList)),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _addToDo(context),
            tooltip: 'Add ToDo',
            backgroundColor: ColorService.main,
            child: const Icon(Icons.add, size: 30),
          ),
          drawer: const CustomDrawer(),
        );
      },
    );
  }
}
