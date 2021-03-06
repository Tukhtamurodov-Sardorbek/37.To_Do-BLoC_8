import 'package:flutter/material.dart';
import 'package:todo_app/pages/recycle_bin.dart';
import 'package:todo_app/pages/home_page.dart';

class AppRouter {
  Route? onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case HomePage.id:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case RecycleBin.id:
        return MaterialPageRoute(builder: (context) => const RecycleBin());
    }
    return null;
  }
}
