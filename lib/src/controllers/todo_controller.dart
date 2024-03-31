import 'package:flutter/material.dart';
import 'package:todo_list_api/src/models/todo_model.dart';
import 'package:todo_list_api/src/repositories/todo_repository.dart';

class TodoController {
  List<TodoModel> todos = [];
  final TodoRepository repository;
  final state = ValueNotifier<TodoState>(TodoState.start);

  TodoController([TodoRepository? repository])
      : repository = repository ?? TodoRepository();

  start() async {
    state.value = TodoState.loading;
    try {
      todos = await repository.fetchAll();
      state.value = TodoState.success;
    } catch (e) {
      state.value = TodoState.error;
    }
  }
}

enum TodoState { start, loading, success, error }
