import 'package:flutter/material.dart';

class CounterCard extends StatelessWidget {
  final String label;
  final int initialValue;
  final ValueChanged<int> onValueChanged;

  const CounterCard({
    required this.label,
    required this.initialValue,
    required this.onValueChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int value = initialValue;

    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    if (value > 0) {
                      value--;
                      onValueChanged(value);
                    }
                  },
                  icon: const Icon(Icons.remove),
                ),
                Text(
                  value.toString(),
                  style: const TextStyle(fontSize: 20),
                ),
                IconButton(
                  onPressed: () {
                    value++;
                    onValueChanged(value);
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
