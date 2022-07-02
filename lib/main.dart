import 'package:flutter/material.dart';
import 'package:todo_app/pages/home_page.dart';
import 'package:path_provider/path_provider.dart';

import 'bloc/bloc_exports.dart';

void main() async{
  // * For hydrated
  WidgetsFlutterBinding.ensureInitialized();

  final storagePath = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory(),
  );
  HydratedBlocOverrides.runZoned(
    () => runApp(const MyApp()),
    storage: storagePath,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ToDoBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TODO APP',
        home: HomePage(),
      ),
    );
  }
}