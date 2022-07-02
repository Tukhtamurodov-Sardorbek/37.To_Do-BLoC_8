import 'package:flutter/material.dart';
import 'package:todo_app/bloc/bloc_exports.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/services/color_service.dart';

class ToDoList extends StatelessWidget {
  final int pageIndex;
  const ToDoList({Key? key, required this.pageIndex}) : super(key: key);

  void _removeOrDelete(BuildContext context, ToDo todo) {
    todo.isDeleted
        ? context.read<ToDoBloc>().add(DeleteToDo(todo: todo))
        : context.read<ToDoBloc>().add(RemoveToDo(todo: todo));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToDoBloc, ToDoState>(builder: (context, state) {
      final list = pageIndex == 0
          ? state.pendingList
          : pageIndex == 1
              ? state.completedList
              : pageIndex == 2
                  ? state.favoriteList
                  : state.deletedList;

      print('Index: $pageIndex');
      // return ListView.builder(
      //   physics: const BouncingScrollPhysics(),
      //   padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 70.0),
      //   itemCount: list.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     final todo = list[index];
      //     return GestureDetector(
      //       onLongPress: () => _removeOrDelete(context, todo),
      //       child: BuildList(todo: todo),
      //     );
      //   },
      // );
      // * In order to open only one panel
      return ExpansionPanelList.radio(
        children: list
            .map(
              (todo) => ExpansionPanelRadio(
                value: todo.id,
                headerBuilder: (context, isOpen) => BuildList(todo: todo),
                body: ListTile(
                  title: SelectableText.rich(
                      textAlign: TextAlign.start,
                      TextSpan(children: [
                        const TextSpan(
                          text: 'Title\n',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: todo.title,
                          style: const TextStyle(),
                        ),
                        const TextSpan(
                          text: '\n\nDescription\n',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: todo.description,
                          style: const TextStyle(),
                        ),
                      ])),
                ),
              ),
            )
            .toList(),
      );
    });
  }
}

class BuildList extends StatelessWidget {
  final ToDo todo;
  const BuildList({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        todo.title,
        style: TextStyle(
          decoration:
              todo.isDone ? TextDecoration.lineThrough : TextDecoration.none,
          decorationColor: ColorService.main,
          decorationThickness: 3,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
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
          if (!todo.isDeleted) {
            context.read<ToDoBloc>().add(UpdateToDo(todo: todo));
          }
        },
      ),
    );
  }
}
