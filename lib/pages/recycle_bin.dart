import 'package:flutter/material.dart';
import 'package:todo_app/widgets/drawer.dart';
import 'package:todo_app/widgets/todo_list.dart';

class RecycleBin extends StatelessWidget {
  static const String id = '/bin';
  const RecycleBin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurpleAccent.shade700,
        title: const Text(
          'Recycle Bin',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Chip(label: Text('ToDos')),
          Expanded(child: ToDoList(list: [])),
        ],
      ),
      drawer: const CustomDrawer(),
    );
  }
}
