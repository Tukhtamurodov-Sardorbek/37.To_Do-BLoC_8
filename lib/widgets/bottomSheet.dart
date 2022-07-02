import 'package:flutter/material.dart';
import 'package:todo_app/bloc/bloc_exports.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/services/color_service.dart';
import 'package:todo_app/services/guid_gen.dart';

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(
        20.0,
        20.0,
        20.0,
        MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        children: [
          Text(
            'Add ToDo',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                // color: ColorService.main,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10.0),
          TextField(
            autofocus: true,
            textInputAction: TextInputAction.next,
            controller: titleController,
            decoration: InputDecoration(
              label: Text(
                'Title',
                // style: TextStyle(color: ColorService.main),
              ),
              // focusColor: ColorService.main,
              border: const OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                // borderSide: BorderSide(color: ColorService.main, width: 5.0),
              ),
              focusedBorder: OutlineInputBorder(
                // borderSide: BorderSide(color: ColorService.main, width: 3.0),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          TextField(
            maxLines: null,
            textInputAction: TextInputAction.newline,
            keyboardType: TextInputType.multiline,
            controller: descriptionController,
            decoration: InputDecoration(
              label: Text(
                'Description',
                // style: TextStyle(color: ColorService.main),
              ),
              // focusColor: ColorService.main,
              border: const OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                // borderSide: BorderSide(color: ColorService.main, width: 5.0),
              ),
              focusedBorder: OutlineInputBorder(
                // borderSide: BorderSide(color: ColorService.main, width: 3.0),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    // color: ColorService.main,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  var todo = ToDo(
                    id: GUIDGen.generate(),
                    title: titleController.text.trim(),
                    description: descriptionController.text.trim(),
                  );
                  context.read<ToDoBloc>().add(AddToDo(todo: todo));
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  // primary: ColorService.main,
                ),
                child: const Text(
                  'Add',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: ColorService.white,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
