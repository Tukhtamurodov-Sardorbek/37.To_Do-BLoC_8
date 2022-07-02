import 'package:flutter/material.dart';
import 'package:todo_app/bloc/bloc_exports.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/services/color_service.dart';

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
    return ListTile(
      title: Text(
        todo.title,
        style: TextStyle(
          decoration:
              todo.isDone ? TextDecoration.lineThrough : TextDecoration.none,
          decorationColor: ColorService.main,
          decorationThickness: 3,
        ),
      ),
      leading: Icon(
        Icons.star_border_outlined,
        color: ColorService.main,
      ),
      trailing: Checkbox(
        activeColor: ColorService.main,
        checkColor: ColorService.white,
        value: todo.isDone,
        onChanged: (value) {
          if(!todo.isDeleted){
            context.read<ToDoBloc>().add(UpdateToDo(todo: todo));
          }
        },
      ),
    );
  }
}
