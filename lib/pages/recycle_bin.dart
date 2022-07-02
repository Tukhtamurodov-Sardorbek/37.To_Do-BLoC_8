import 'package:flutter/material.dart';
import 'package:todo_app/bloc/bloc_exports.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/services/color_service.dart';
import 'package:todo_app/widgets/drawer.dart';
import 'package:todo_app/widgets/todo_list.dart';

class RecycleBin extends StatelessWidget {
  static const String id = '/bin';
  const RecycleBin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToDoBloc, ToDoState>(
      builder: (context, state) {
        List<ToDo> todoList = state.deletedList;
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            foregroundColor: ColorService.white,
            // backgroundColor: ColorService.main,
            title: const Text(
              'Recycle Bin',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Chip(label: Text('${todoList.length} ToDos')),
              const Expanded(child: ToDoList(pageIndex: 10)),
            ],
          ),
          drawer: const CustomDrawer(),
        );
      }
    );
  }
}
