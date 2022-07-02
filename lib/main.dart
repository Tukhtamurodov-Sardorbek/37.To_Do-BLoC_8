import 'package:flutter/material.dart';
import 'package:todo_app/pages/home_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app/services/router.dart';

import 'bloc/bloc_exports.dart';

void main() async {
  // * For Hydrated Storage
  WidgetsFlutterBinding.ensureInitialized();

  final storagePath = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  HydratedBlocOverrides.runZoned(
    () => runApp(MyApp(appRouter: AppRouter())),
    storage: storagePath,
  );
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({Key? key, required this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ToDoBloc()),
        BlocProvider(create: (context) => ThemeBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TODO APP',
        onGenerateRoute: appRouter.onGenerate,
        home: const HomePage(),
      ),
    );
  }
}
