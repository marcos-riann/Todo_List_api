import 'package:dio/dio.dart';
import 'package:todo_list_api/src/models/todo_model.dart';

class TodoRepository {
  final Dio dio;
  final String url = 'https://jsonplaceholder.typicode.com/todos';

  TodoRepository([Dio? dio]) : dio = dio ?? Dio();

  Future<List<TodoModel>> fetchAll() async {
    final response = await dio.get(url);
    final lista = response.data as List;

    return lista.map((e) => TodoModel.fromJson(e)).toList();
  }
}
