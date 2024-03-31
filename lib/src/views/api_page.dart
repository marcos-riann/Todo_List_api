import 'package:flutter/material.dart';

class ApiPage extends StatefulWidget {
  const ApiPage({super.key});

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Page'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return const Text('data');
        },
      ),
    );
  }
}
