import 'package:coffe_searcher_app/screens/auth_screen.dart';
import 'package:coffe_searcher_app/screens/main_screen.dart';
import 'package:flutter/material.dart';

import 'bloc/is_auth_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:StreamBuilder(
        stream: getAuthStateBloc.itemStream,
        initialData: getAuthStateBloc.defaultItem,
        // ignore: missing_return
        builder: (BuildContext context, AsyncSnapshot<AuthStateItem> snapshot){
          switch(snapshot.data){
            case AuthStateItem.AUTH:
              return AuthScreen();
            case AuthStateItem.isAUTH:
              return  MainScreen();
            case AuthStateItem.REG:
              break;
          }
        },
      ),
    );
  }
}

