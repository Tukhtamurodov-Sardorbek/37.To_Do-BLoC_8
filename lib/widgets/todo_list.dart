import 'package:flutter/material.dart';
import 'package:todo_app/bloc/bloc_exports.dart';
import 'package:todo_app/models/todo_model.dart';

class ToDoList extends StatelessWidget {
  final List<ToDo> list;
  const ToDoList({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 70.0),
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onLongPress: () => context.read<ToDoBloc>().add(DeleteToDo(todo: list[index])),
          child: CheckboxListTile(
            title: Text(list[index].title),
            secondary: Icon(
              Icons.star_border_outlined,
              color: Colors.deepPurpleAccent.shade700,
            ),
            controlAffinity: ListTileControlAffinity.trailing,
            activeColor: Colors.deepPurpleAccent.shade700,
            checkColor: Colors.white,
            value: list[index].isDone,
            onChanged: (value) {
              context.read<ToDoBloc>().add(UpdateToDo(todo: list[index]));
            },
          ),
        );
      },
    );
  }
}