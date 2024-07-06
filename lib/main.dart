import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state_management/add_todo_page.dart';
import 'package:flutter_bloc_state_management/cubit/todo_cubit.dart';
import 'package:flutter_bloc_state_management/todo_list.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => TodoCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const TodoList(),
        '/add-todo': (_) => const AddTodoPage(),
      },
    );
  }
}
