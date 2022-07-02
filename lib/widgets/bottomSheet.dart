import 'package:flutter/material.dart';
import 'package:todo_app/bloc/bloc_exports.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/services/guid_gen.dart';

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    return ListView(
      padding: EdgeInsets.fromLTRB(
        20.0,
        20.0,
        20.0,
        MediaQuery.of(context).viewInsets.bottom,
      ),
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
          decoration: const InputDecoration(
            label: Text('Title'),
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
                  var todo = ToDo(
                      id: GUIDGen.generate(),
                      title: titleController.text.trim());
                  context.read<ToDoBloc>().add(AddToDo(todo: todo));
                  Navigator.pop(context);
                },
                child: const Text('Add')),
          ],
        )
      ],
    );
  }
}
