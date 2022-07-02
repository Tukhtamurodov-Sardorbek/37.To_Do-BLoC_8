import 'package:flutter/material.dart';
import 'package:todo_app/bloc/bloc_exports.dart';
import 'package:todo_app/models/todo_model.dart';

class ToDoList extends StatelessWidget {
  final List<ToDo> list;
  const ToDoList({Key? key, required this.list}) : super(key: key);

  void _removeOrDelete(BuildContext context, ToDo todo) {
    todo.isDeleted
        ? context.read<ToDoBloc>().add(DeleteToDo(todo: todo))
        : context.read<ToDoBloc>().add(RemoveToDo(todo: todo));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 70.0),
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        final todo = list[index];
        return GestureDetector(
          onLongPress: () => _removeOrDelete(context, todo),
          child: BuildList(todo: todo),
        );
      },
    );
  }
}

class BuildList extends StatelessWidget {
  final ToDo todo;
  const BuildList({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        todo.title,
        style: TextStyle(
          decoration:
              todo.isDone ? TextDecoration.lineThrough : TextDecoration.none,
          decorationColor: Colors.deepPurpleAccent.shade700,
          decorationThickness: 3,
        ),
      ),
      secondary: Icon(
        Icons.star_border_outlined,
        color: Colors.deepPurpleAccent.shade700,
      ),
      controlAffinity: ListTileControlAffinity.trailing,
      activeColor: Colors.deepPurpleAccent.shade700,
      checkColor: Colors.white,
      value: todo.isDone,
      onChanged: (value) {
        context.read<ToDoBloc>().add(UpdateToDo(todo: todo));
      },
    );
  }
}
