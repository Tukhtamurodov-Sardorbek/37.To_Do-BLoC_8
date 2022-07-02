import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.deepPurpleAccent.shade700,
              padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 20.0),
              child: Text('Todo Drawer', style: Theme.of(context).textTheme.headline5,),
            ),
            ListTile(
              leading: Icon(Icons.folder_special, color: Colors.deepPurpleAccent.shade700,),
              title: const Text('Home'),
              trailing: Text('0'),
            ),
            Divider(color: Colors.deepPurpleAccent.shade700),
            ListTile(
              leading: Icon(Icons.delete, color: Colors.deepPurpleAccent.shade700,),
              title: const Text('Bin'),
              trailing: Text('0'),
            ),
          ],
        ),
      ),
    );
  }
}
