import 'package:flutter/material.dart';
import 'package:todo_app/bloc/bloc_exports.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/services/color_service.dart';

class PopUpButton extends StatelessWidget {
  final ToDo todo;
  final VoidCallback mark;

  const PopUpButton({
    Key? key,
    required this.todo,
    required this.mark,
  }) : super(key: key);

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
                        title: Text('Restore', style: TextStyle(color: ColorService.main, fontWeight: FontWeight.bold),),
                        leading: Icon(Icons.restore_from_trash, color: ColorService.green,),
                      ),
                      onTap: () {},
                    ),
                    PopupMenuItem(
                      onTap: (){
                        return context.read<ToDoBloc>().add(DeleteToDo(todo: todo));
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
                        title: Text('Edit', style: TextStyle(color: state.nightMode ? ColorService.lightMain2 : ColorService.main, fontWeight: FontWeight.bold),),
                        leading: Icon(Icons.edit, color: state.nightMode ? ColorService.lightMain2 : ColorService.main),
                      ),
                      onTap: () {},
                    ),
                    PopupMenuItem(
                      child: ListTile(
                        title: Text(todo.isFavorite ? 'Remove from bookmark' :  'Add to bookmark', style: TextStyle(color: state.nightMode ? ColorService.lightMain2 : ColorService.main, fontWeight: FontWeight.bold),),
                        leading: Icon(todo.isFavorite ? Icons.bookmark_remove : Icons.bookmark_add, color: state.nightMode ? ColorService.lightMain2 : ColorService.main),
                      ),
                      onTap: () {
                        return context.read<ToDoBloc>().add(MarkFavoriteOrUnfavoriteToDO(todo: todo));
                      },
                    ),
                    PopupMenuItem(
                      onTap: (){
                        return context.read<ToDoBloc>().add(RemoveToDo(todo: todo));
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
