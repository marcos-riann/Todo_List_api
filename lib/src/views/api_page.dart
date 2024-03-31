import 'package:flutter/material.dart';
import 'package:todo_list_api/src/controllers/todo_controller.dart';

class ApiPage extends StatefulWidget {
  const ApiPage({super.key});

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  final controller = TodoController();

  @override
  void initState() {
    super.initState();
    controller.start();
  }

  _start() {
    return Container();
  }

  _loading() {
    return const Center(child: CircularProgressIndicator());
  }

  _success() {
    return ListView.builder(
      itemCount: controller.todos.length,
      itemBuilder: (context, index) {
        final todo = controller.todos[index];
        return ListTile(
          leading: Checkbox(
            value: todo.completed,
            onChanged: (value) {},
          ),
          title: Text(todo.title),
        );
      },
    );
  }

  _error() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          controller.start();
        },
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.blue[100]),
          shape: MaterialStatePropertyAll(
            ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        child: Text(
          'Tentar novamente',
          style: TextStyle(color: Colors.indigo[900]),
        ),
      ),
    );
  }

  _stateManagement(TodoState state) {
    switch (state) {
      case TodoState.start:
        return _start();
      case TodoState.loading:
        return _loading();
      case TodoState.success:
        return _success();
      case TodoState.error:
        return _error();
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo\'s Page'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () {
              controller.start();
            },
            icon: const Icon(Icons.refresh_outlined),
          ),
        ],
      ),
      body: AnimatedBuilder(
          animation: controller.state,
          builder: (context, child) {
            return _stateManagement(controller.state.value);
          }),
    );
  }
}
