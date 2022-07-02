import 'package:flutter/material.dart';
import 'package:todo_app/bloc/bloc_exports.dart';
import 'package:todo_app/pages/completed_page.dart';
import 'package:todo_app/pages/favorite_page.dart';
import 'package:todo_app/pages/pending_page.dart';
import 'package:todo_app/services/color_service.dart';
import 'package:todo_app/widgets/bottomSheet.dart';
import 'package:todo_app/widgets/drawer.dart';

class HomePage extends StatefulWidget {
  static const String id = '/tabs';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Map<String, Widget> _pages = {
    'Pending Tasks': const PendingPage(),
    'Completed Tasks': const CompletedPage(),
    'Favorite Tasks': const FavoritePage(),
  };

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
        final pending = state.pendingList.length;
        final completed = state.completedList.length;
        final favorite = state.favoriteList.length;

        return Scaffold(
          drawer: const CustomDrawer(),
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              _pages.keys.toList()[_selectedPageIndex],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Chip(
                label: FittedBox(
                  child: Text(
                    '${pending >= 999 ? '999+' : pending}  Pending  |  ${completed >= 999 ? '999+' : completed}  Completed  |  ${favorite >= 999 ? '999+' : favorite}  Favorite',
                    style: const TextStyle(
                      color: ColorService.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                backgroundColor: ColorService.main,
              ),
              Expanded(child: _pages.values.toList()[_selectedPageIndex]),
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
            onTap: (index) {
              setState(() {
                _selectedPageIndex = index;
              });
            },
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
