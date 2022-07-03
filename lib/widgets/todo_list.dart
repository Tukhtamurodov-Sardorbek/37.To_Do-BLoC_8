import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/bloc/bloc_exports.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/services/color_service.dart';
import 'package:todo_app/widgets/popup_button.dart';

class ToDoList extends StatelessWidget {
  final int pageIndex;
  const ToDoList({Key? key, required this.pageIndex}) : super(key: key);

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

      debugPrint('Index: $pageIndex');

      // * In order to open only one panel
      return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
        return ExpansionPanelList.radio(
          children: list
              .map(
                (todo) => ExpansionPanelRadio(
                  value: todo.id,
                  headerBuilder: (context, isOpen) => BuildList(todo: todo),
                  body: ListTile(
                    title: SelectableText.rich(
                      textAlign: TextAlign.start,
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Title\n',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: state.nightMode
                                  ? ColorService.lightMain2
                                  : ColorService.main,
                            ),
                          ),
                          TextSpan(
                            text: todo.title,
                            style: const TextStyle(),
                          ),
                          TextSpan(
                            text: '\n\nDescription\n',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: state.nightMode
                                  ? ColorService.lightMain2
                                  : ColorService.main,
                            ),
                          ),
                          TextSpan(
                            text: todo.description,
                            style: const TextStyle(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        );
      });
    });
  }
}

class BuildList extends StatelessWidget {
  final ToDo todo;
  const BuildList({Key? key, required this.todo}) : super(key: key);

  void _removeOrDelete(BuildContext context, ToDo todo) {
    todo.isDeleted
        ? context.read<ToDoBloc>().add(DeleteToDo(todo: todo))
        : context.read<ToDoBloc>().add(RemoveToDo(todo: todo));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return ListTile(
          contentPadding: const EdgeInsets.only(left: 12.0),
          minLeadingWidth: 20,
          title: Text(
            todo.title,
            style: TextStyle(
              decoration: todo.isDone
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              decorationColor:
                  state.nightMode ? ColorService.lightMain2 : ColorService.main,
              decorationThickness: 3,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            DateFormat('dd-MM-yyyy  |  hh:mm:ss')
                .format(DateTime.parse(todo.createdTime)),
          ),
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star_border_outlined,
                color: state.nightMode
                    ? ColorService.lightMain2
                    : ColorService.main,
              ),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Checkbox(
                activeColor: state.nightMode
                    ? ColorService.lightMain2
                    : ColorService.main,
                checkColor: ColorService.white,
                value: todo.isDone,
                onChanged: (value) {
                  if (!todo.isDeleted) {
                    context.read<ToDoBloc>().add(UpdateToDo(todo: todo));
                  }
                },
              ),
              PopUpButton(
                  deleteFunc: () => _removeOrDelete(context, todo),
                  isDeleted: todo.isDeleted),
            ],
          ),
        );
      },
    );
  }
}
