import 'package:flutter/material.dart';
import 'package:todo_app/bloc/bloc_exports.dart';
import 'package:todo_app/services/color_service.dart';
import 'package:todo_app/widgets/todo_list.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToDoBloc, ToDoState>(
      builder: (context, state) {
        final todoList = state.favoriteList;
        return ToDoList(list: todoList);
      },
    );
  }
}
