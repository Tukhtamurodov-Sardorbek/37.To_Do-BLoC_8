import 'package:flutter/material.dart';
import 'package:todo_app/bloc/bloc_exports.dart';
import 'package:todo_app/models/todo_model.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  void _addToDo(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          final titleController = TextEditingController();
          return ListView(
            padding: EdgeInsets.fromLTRB(
                20.0, 20.0, 20.0, MediaQuery.of(context).viewInsets.bottom),
            children: [
              const Text(
                'Add ToDo',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10.0),
              TextField(
                autocorrect: true,
                autofocus: true,
                controller: titleController,
                decoration: InputDecoration(
                  label: const Text('Title'),
                  border: OutlineInputBorder(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        var todo = ToDo(title: titleController.text.trim());
                        context.read<ToDoBloc>().add(AddToDo(todo: todo));
                        Navigator.pop(context);
                      },
                      child: const Text('Add')),
                ],
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToDoBloc, ToDoState>(builder: (context, state) {
      List<ToDo> todoList = state.todoList;
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          foregroundColor: Colors.white,
          backgroundColor: Colors.deepPurpleAccent.shade700,
          title: const Text(
            'ToDo App',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            Expanded(child: ToDoList(list: todoList)),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _addToDo(context),
          tooltip: 'Add ToDo',
          backgroundColor: Colors.deepPurpleAccent.shade700,
          child: const Icon(Icons.add, size: 30),
        ),
      );
    });
  }
}

class ToDoList extends StatelessWidget {
  final List<ToDo> list;
  const ToDoList({Key? key, required this.list}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 70.0),
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onLongPress: () => context.read<ToDoBloc>().add(DeleteToDo(todo: list[index])),
          child: CheckboxListTile(
            title: Text(list[index].title),
            secondary: Icon(
              Icons.star_border_outlined,
              color: Colors.deepPurpleAccent.shade700,
            ),
            controlAffinity: ListTileControlAffinity.trailing,
            activeColor: Colors.deepPurpleAccent.shade700,
            checkColor: Colors.white,
            value: list[index].isDone,
            onChanged: (value) {
              context.read<ToDoBloc>().add(UpdateToDo(todo: list[index]));
            },
          ),
        );
      },
    );
  }
}
