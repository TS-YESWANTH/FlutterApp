import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final int days = 30;
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog App'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          child: Text("Hello World! $days"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
