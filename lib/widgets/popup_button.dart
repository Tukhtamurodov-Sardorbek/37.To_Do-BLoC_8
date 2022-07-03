import 'package:flutter/material.dart';
import 'package:todo_app/services/color_service.dart';

class PopUpButton extends StatelessWidget {
  final bool isDeleted;
  final VoidCallback deleteFunc;
  const PopUpButton({
    Key? key,
    required this.deleteFunc,
    required this.isDeleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      splashRadius: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      itemBuilder: isDeleted
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
                  onTap: deleteFunc,
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
                    title: Text('Edit', style: TextStyle(color: ColorService.main, fontWeight: FontWeight.bold),),
                    leading: Icon(Icons.edit, color: ColorService.main),
                  ),
                  onTap: () {},
                ),
                PopupMenuItem(
                  child: ListTile(
                    title: Text('Add to bookmark', style: TextStyle(color: ColorService.main, fontWeight: FontWeight.bold),),
                    leading: Icon(Icons.bookmark, color: ColorService.main),
                  ),
                  onTap: () {},
                ),
                PopupMenuItem(
                  onTap: deleteFunc,
                  child: ListTile(
                    title: Text('Delete', style: TextStyle(color: ColorService.main, fontWeight: FontWeight.bold),),
                    leading: Icon(Icons.delete, color: ColorService.main),
                  ),
                ),
              ];
            }),
    );
  }
}
