import 'package:flutter/material.dart';
import 'package:todo_list_api/src/models/todo_model.dart';
import 'package:todo_list_api/src/repositories/todo_repository.dart';

class TodoController {
  List<TodoModel> todos = [];
  final TodoRepository repository;
  final state = ValueNotifier<State>(State.start);

  TodoController([TodoRepository? repository])
      : repository = repository ?? TodoRepository();

  start() async {
    state.value = State.loading;
    try {
      todos = await repository.fetchAll();
      state.value = State.success;
    } catch (e) {
      state.value = State.error;
    }
  }
}

enum State { start, loading, success, error }
