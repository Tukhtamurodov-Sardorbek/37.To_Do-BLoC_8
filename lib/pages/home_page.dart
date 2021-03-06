import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/bloc/bloc_exports.dart';
import 'package:todo_app/services/color_service.dart';
import 'package:todo_app/widgets/bottomSheet.dart';
import 'package:todo_app/widgets/drawer.dart';
import 'package:todo_app/widgets/todo_list.dart';

class HomePage extends StatefulWidget {
  static const String id = '/tabs';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _pages = [
    'Pending Tasks',
    'Completed Tasks',
    'Saved Tasks',
  ];

  int _selectedPageIndex = 0;

  void _addToDo(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) => const SafeArea(
        child: BottomSheetContent(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToDoBloc, ToDoState>(
      builder: (context, state) {
        final pending =
            state.pendingList.length >= 999 ? '999+' : state.pendingList.length;
        final completed = state.completedList.length >= 999
            ? '999+'
            : state.completedList.length;
        final favorite = state.savedList.length >= 999
            ? '999+'
            : state.savedList.length;

        return Scaffold(
          drawer: const CustomDrawer(),
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              _pages[_selectedPageIndex],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          body: Stack(
            children: [
              ListView(
                padding: const EdgeInsets.only(bottom: 80.0, top: 46.0),
                physics: const BouncingScrollPhysics(),
                children: [
                  ToDoList(pageIndex: _selectedPageIndex),
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
                        '$pending  Pending  |  $completed  Completed  |  $favorite  Favorite',
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
          floatingActionButton: _selectedPageIndex == 0
              ? FloatingActionButton(
                  onPressed: () => _addToDo(context),
                  tooltip: 'Add ToDo',
                  child: const Icon(Icons.add, size: 30),
                )
              : null,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedPageIndex,
            onTap: (index) {
              setState(() {
                _selectedPageIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 2.0),
                  child: Lottie.asset(
                    'assets/lottie/pending.json',
                    height: 34,
                    fit: BoxFit.cover,
                    repeat: _selectedPageIndex == 0,
                  ),
                  // Icon(Icons.hourglass_bottom),
                ),
                label: 'Pending Tasks',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 2.0),
                  child: Lottie.asset(
                    'assets/lottie/completed.json',
                    height: 34,
                    fit: BoxFit.cover,
                    repeat: _selectedPageIndex == 1,
                  ),
                  // Icon(Icons.done),
                ),
                label: 'Completed Tasks',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Lottie.asset(
                    'assets/lottie/saved.json',
                    height: 34,
                    fit: BoxFit.cover,
                    repeat: _selectedPageIndex == 2,
                  ),
                  // Icon(Icons.bookmark),
                ),
                label: 'Saved Tasks',
              ),
            ],
          ),
        );
      },
    );
  }
}
