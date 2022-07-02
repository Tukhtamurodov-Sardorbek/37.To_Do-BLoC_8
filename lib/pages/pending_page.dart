import 'package:flutter/material.dart';
import 'package:todo_app/bloc/bloc_exports.dart';
import 'package:todo_app/services/color_service.dart';
import 'package:todo_app/widgets/todo_list.dart';

class PendingPage extends StatelessWidget {
  const PendingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToDoBloc, ToDoState>(
      builder: (context, state) {
        final todoList = state.pendingList;
        return ToDoList(list: todoList);
      },
    );
  }
}
