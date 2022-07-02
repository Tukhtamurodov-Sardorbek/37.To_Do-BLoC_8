import 'package:flutter/material.dart';
import 'package:todo_app/bloc/bloc_exports.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/services/color_service.dart';
import 'package:todo_app/widgets/bottomSheet.dart';
import 'package:todo_app/widgets/drawer.dart';
import 'package:todo_app/widgets/todo_list.dart';

class HomePage extends StatelessWidget {
  static const String id = '/tabs';
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
          drawer: const CustomDrawer(),
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'Tabs',
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
            child: const Icon(Icons.add, size: 30),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: 0,
            backgroundColor: ColorService.main,
            selectedItemColor: ColorService.white,
            unselectedItemColor: ColorService.grey,
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12,
            ),
            onTap: (index) {},
            items: const [
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 2.0),
                    child: Icon(Icons.list),
                  ),
                  label: 'Pending Tasks'),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 2.0),
                    child: Icon(Icons.done),
                  ),
                  label: 'Completed Tasks'),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 2.0),
                    child: Icon(Icons.favorite),
                  ),
                  label: 'Favorite Tasks'),
            ],
          ),
        );
      },
    );
  }
}
