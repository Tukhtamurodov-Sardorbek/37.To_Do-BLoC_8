import 'package:flutter/material.dart';
import 'package:todo_app/bloc/bloc_exports.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/services/color_service.dart';
import 'package:todo_app/services/guid_gen.dart';

class BottomSheetContent extends StatelessWidget {
  final ToDo? todo;
  const BottomSheetContent({Key? key, this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController(text: todo == null ? '' : todo!.title);
    final descriptionController = TextEditingController(text: todo == null ? '' : todo!.description);
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
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
                todo == null ? 'Create' : 'Edit',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: state.nightMode
                      ? ColorService.lightMain2
                      : ColorService.main,
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
                    style: TextStyle(
                      color: state.nightMode
                          ? ColorService.lightMain2
                          : ColorService.main,
                    ),
                  ),
                  focusColor: state.nightMode
                      ? ColorService.lightMain2
                      : ColorService.main,
                  border: const OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: state.nightMode
                            ? ColorService.lightMain2
                            : ColorService.main,
                        width: 3.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: state.nightMode
                            ? ColorService.lightMain2
                            : ColorService.main,
                        width: 4.0,
                    ),
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
                    style: TextStyle(
                      color: state.nightMode
                          ? ColorService.lightMain2
                          : ColorService.main,
                    ),
                  ),
                  focusColor: state.nightMode
                      ? ColorService.lightMain2
                      : ColorService.main,
                  border: const OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: state.nightMode
                            ? ColorService.lightMain2
                            : ColorService.main,
                        width: 3.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: state.nightMode
                            ? ColorService.lightMain2
                            : ColorService.main,
                        width: 4.0),
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
                        color: state.nightMode
                            ? ColorService.lightMain2
                            : ColorService.main,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final newTodo = ToDo(
                        id: todo == null ? GUIDGen.generate() : todo!.id,
                        isSaved: todo == null ? false : todo!.isSaved,
                        isDone: false,
                        title: titleController.text.trim(),
                        description: descriptionController.text.trim(),
                        createdTime: DateTime.now().toString(),
                      );
                      todo == null
                          ? context.read<ToDoBloc>().add(AddToDo(todo: newTodo))
                          : context.read<ToDoBloc>().add(EditToDo(oldVersion: todo!, newVersion: newTodo,));
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: state.nightMode
                          ? ColorService.lightMain2
                          : ColorService.main,
                    ),
                    child: Text(
                      todo == null ? 'Add' : 'Save',
                      style: const TextStyle(
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
      },
    );
  }
}
