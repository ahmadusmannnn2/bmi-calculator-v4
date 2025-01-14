import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  final List<Map<String, dynamic>> history = [
    {"bmi": 22.5, "category": "Normal", "date": "2025-01-01"},
    {"bmi": 28.4, "category": "Overweight", "date": "2024-12-31"},
  ];

  HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI History'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: history.length,
        itemBuilder: (context, index) {
          final item = history[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text(item['bmi'].toStringAsFixed(1)),
            ),
            title: Text("BMI: ${item['bmi']} - ${item['category']}"),
            subtitle: Text("Date: ${item['date']}"),
          );
        },
      ),
    );
  }
}
