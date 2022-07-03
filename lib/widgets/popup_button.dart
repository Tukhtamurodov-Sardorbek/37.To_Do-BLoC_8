import 'package:flutter/material.dart';
import 'package:todo_app/bloc/bloc_exports.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/services/color_service.dart';
import 'package:todo_app/widgets/bottomSheet.dart';

class PopUpButton extends StatelessWidget {
  final ToDo todo;

  const PopUpButton({
    Key? key,
    required this.todo,
  }) : super(key: key);


  void _edit(BuildContext context) {
    // * To close the popupmenu
    Navigator.pop(context);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) => SafeArea(
        child: BottomSheetContent(todo: todo),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return PopupMenuButton(
          splashRadius: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          itemBuilder: todo.isDeleted
              ? ((context) {
                  return [
                    PopupMenuItem(
                      child: ListTile(
                        onTap: (){
                          return context.read<ToDoBloc>().add(RestoreEvent(todo: todo));
                        },
                        title: Text('Restore', style: TextStyle(color: ColorService.main, fontWeight: FontWeight.bold),),
                        leading: Icon(Icons.restore_from_trash, color: ColorService.green,),
                      ),
                    ),
                    PopupMenuItem(
                      onTap: (){
                        return context.read<ToDoBloc>().add(DeleteEvent(todo: todo));
                      },
                      child: ListTile(
                        title: Text('Delete Permanently', style: TextStyle(color: ColorService.main, fontWeight: FontWeight.bold),),
                        leading: Icon(Icons.delete_forever, color: ColorService.red,),
                      ),
                    ),
                  ];
                })
              : ((context) {
                  return [
                    PopupMenuItem(
                      child: ListTile(
                        onTap: () => _edit(context),
                        title: Text('Edit', style: TextStyle(color: state.nightMode ? ColorService.lightMain2 : ColorService.main, fontWeight: FontWeight.bold),),
                        leading: Icon(Icons.edit, color: state.nightMode ? ColorService.lightMain2 : ColorService.main),
                      ),
                      onTap: () {},
                    ),
                    PopupMenuItem(
                      child: ListTile(
                        title: Text(todo.isSaved ? 'Remove from \nbookmark' :  'Add to \nbookmark', style: TextStyle(color: state.nightMode ? ColorService.lightMain2 : ColorService.main, fontWeight: FontWeight.bold),),
                        leading: Icon(todo.isSaved ? Icons.bookmark_remove : Icons.bookmark_add, color: state.nightMode ? ColorService.lightMain2 : ColorService.main),
                      ),
                      onTap: () {
                        return context.read<ToDoBloc>().add(MarkEvent(todo: todo));
                      },
                    ),
                    PopupMenuItem(
                      onTap: (){
                        return context.read<ToDoBloc>().add(RemoveEvent(todo: todo));
                      },
                      child: ListTile(
                        title: Text('Delete', style: TextStyle(color: state.nightMode ? ColorService.lightMain2 : ColorService.main, fontWeight: FontWeight.bold),),
                        leading: Icon(Icons.delete, color: state.nightMode ? ColorService.lightMain2 : ColorService.main),
                      ),
                    ),
                  ];
                }),
        );
      }
    );
  }
}
