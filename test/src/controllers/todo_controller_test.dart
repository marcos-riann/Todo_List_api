import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_list_api/src/controllers/todo_controller.dart';
import 'package:todo_list_api/src/repositories/todo_repository.dart';

class TodoRepositoryMock extends Mock implements TodoRepository {}

void main() {
  final repository = TodoRepositoryMock();
  final controller = TodoController(repository);

  test('sem o await deve retornar loading como ultimo state', () async {
    expect(controller.state.value, TodoState.start);
    controller.start();
    //expect(controller.state.value, State.loading);
    expect(controller.state.value, TodoState.success);
  });

  test('com o await deve retornar success como ultimo state', () async {
    expect(controller.state.value, TodoState.start);
    await controller.start();
    //expect(controller.state.value, State.loading);
    expect(controller.state.value, TodoState.success);
  });

  test('causando erro', () async {
    when(() => repository.fetchAll()).thenThrow(Exception());

    expect(controller.state.value, TodoState.start);
    await controller.start();
    //expect(controller.state.value, State.loading);
    expect(controller.state.value, TodoState.error);
  });
}
