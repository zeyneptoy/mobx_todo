import 'package:flutter/material.dart';
import 'package:mobx_sample/screens/todo_screen.dart';
import 'package:mobx_sample/stores/todo_store.dart';
import 'package:provider/provider.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final TodoStore todoStore = TodoStore();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => todoStore,
      child: MaterialApp(
        title: 'MobX Todo App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        home: const TodoScreen(),
      ),
    );
  }
}