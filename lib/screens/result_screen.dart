import 'package:flutter/material.dart';
import 'package:myapp/screens/gender_screen.dart';

class ResultScreen extends StatelessWidget {
  final String gender;
  final double height;
  final int weight;
  final int age;
  final double bmi;
  final String category;

  const ResultScreen({
    required this.gender,
    required this.height,
    required this.weight,
    required this.age,
    required this.bmi,
    required this.category,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Result'),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.blue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Your BMI:",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                bmi.toStringAsFixed(1),
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow,
                ),
              ),
              Text(
                category,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: _getCategoryColor(category),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 4),
                      blurRadius: 10,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text("Gender: $gender", style: _infoTextStyle()),
                    Text("Height: ${height.toStringAsFixed(1)} cm", style: _infoTextStyle()),
                    Text("Weight: $weight kg", style: _infoTextStyle()),
                    Text("Age: $age years", style: _infoTextStyle()),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const GenderScreen()),
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Colors.redAccent,
                ),
                child: const Text(
                  'Refresh',
                  style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle _infoTextStyle() {
    return const TextStyle(
      fontSize: 18,
      color: Colors.white,
    );
  }

  Color _getCategoryColor(String category) {
    switch (category.toLowerCase()) {
      case 'normal':
        return Colors.greenAccent;
      case 'overweight':
        return Colors.orangeAccent;
      case 'underweight':
        return Colors.blueAccent;
      default:
        return Colors.redAccent;
    }
  }
}
