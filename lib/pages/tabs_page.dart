import 'package:flutter/material.dart';
import 'package:todo_app/bloc/bloc_exports.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/pages/completed_page.dart';
import 'package:todo_app/pages/favorite_page.dart';
import 'package:todo_app/pages/pending_page.dart';
import 'package:todo_app/services/color_service.dart';
import 'package:todo_app/widgets/bottomSheet.dart';
import 'package:todo_app/widgets/drawer.dart';
import 'package:todo_app/widgets/todo_list.dart';

class HomePage extends StatelessWidget {
  static const String id = '/tabs';
  HomePage({Key? key}) : super(key: key);

  final List<String> _pageTitles = [
    'Pending Tasks',
    'Completed Tasks',
    'Favorite Tasks',
  ];

  int _selectedPageIndex = 0;

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
            title: Text(
              _pageTitles[_selectedPageIndex],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              PendingPage(),
              CompletedPage(),
              FavoritePage(),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _addToDo(context),
            tooltip: 'Add ToDo',
            child: const Icon(Icons.add, size: 30),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedPageIndex,
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
