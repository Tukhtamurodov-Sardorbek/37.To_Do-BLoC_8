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
    return BlocBuilder<ToDoBloc, ToDoState>(builder: (context, state) {
      List<ToDo> todoList = state.deletedList;
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          foregroundColor: ColorService.white,
          title: const Text(
            'Recycle Bin',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  context.read<ToDoBloc>().add(ClearBinEvent());
                },
                child: const Text(
                  'Clear',
                  style: TextStyle(
                    color: ColorService.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ))
          ],
        ),
        body: Stack(
          children: [
            ListView(
              padding: const EdgeInsets.only(bottom: 80.0, top: 46.0),
              physics: const BouncingScrollPhysics(),
              children: const [
                ToDoList(pageIndex: 10),
              ],
            ),
            BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
              return Positioned(
                top: 0.0,
                left: 10.0,
                right: 10.0,
                child: Chip(
                  label: FittedBox(
                    child: Text(
                      '${todoList.length} Deleted',
                      style: const TextStyle(
                        color: ColorService.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  backgroundColor: state.nightMode
                      ? ColorService.lightMain2
                      : ColorService.main,
                ),
              );
            }),
          ],
        ),
        drawer: const CustomDrawer(),
      );
    });
  }
}
