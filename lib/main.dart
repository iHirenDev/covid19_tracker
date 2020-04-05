import 'package:covid19_tracker/BLOC/covid_listVM.dart';
import 'package:covid19_tracker/UI/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() => runApp(MaterialApp(
  home: App(),
  debugShowCheckedModeBanner: false,
));

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return ChangeNotifierProvider(
       create: (_) => CovidListVM(),
       child: Home(),
       );
  }
}

