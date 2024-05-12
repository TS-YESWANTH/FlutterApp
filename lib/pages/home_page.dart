import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const int days = 30;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog App'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          child: const Text("Hello World! $days"),
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
