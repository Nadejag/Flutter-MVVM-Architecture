import 'package:flutter/material.dart';
import 'package:mvvm_architecture/utils/routes/routes_name.dart';
import 'package:mvvm_architecture/view/login_view.dart';

import '../../view/home_screen.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesNames.home:
        return MaterialPageRoute(builder: (BuildContext context)=>HomeScreen());
      case RoutesNames.login:
        return MaterialPageRoute(builder: (BuildContext context)=>LoginView());
      default:
        return MaterialPageRoute(builder: (_){
          return Scaffold(
            body: Center(
              child: Text("No route defined"),
            ),
          );
        });
    }
  }
}