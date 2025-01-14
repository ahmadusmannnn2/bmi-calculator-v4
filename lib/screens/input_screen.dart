import 'package:flutter/material.dart';
import 'package:myapp/screens/result_screen.dart';
import 'package:myapp/widgets/counter_card.dart';

class InputScreen extends StatefulWidget {
  final String gender;

  const InputScreen({required this.gender, super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  double height = 170.0;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange, Colors.pink],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Please enter your details",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CounterCard(
                  label: 'Weight (kg)',
                  initialValue: weight,
                  onValueChanged: (newValue) {
                    setState(() => weight = newValue);
                  },
                ),
                CounterCard(
                  label: 'Age',
                  initialValue: age,
                  onValueChanged: (newValue) {
                    setState(() => age = newValue);
                  },
                ),
              ],
            ),
            Column(
              children: [
                const Text(
                  "Height (cm):",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Slider(
                  value: height,
                  min: 100,
                  max: 200,
                  divisions: 100,
                  label: height.toStringAsFixed(1),
                  onChanged: (value) => setState(() => height = value),
                  activeColor: Colors.white,
                  inactiveColor: Colors.white60,
                ),
                Text(
                  "${height.toStringAsFixed(1)} cm",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                final bmi = weight / ((height / 100) * (height / 100));
                String category;
                if (bmi < 18.5) {
                  category = 'Underweight';
                } else if (bmi < 24.9) {
                  category = 'Normal';
                } else if (bmi < 29.9) {
                  category = 'Overweight';
                } else {
                  category = 'Obese';
                }

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(
                      gender: widget.gender,
                      height: height,
                      weight: weight,
                      age: age,
                      bmi: bmi,
                      category: category,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                backgroundColor: Colors.greenAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Calculate',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
