class BMICalculator {
  static String calculateResult(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi < 24.9) {
      return 'Normal';
    } else if (bmi < 29.9) {
      return 'Overweight';
    } else {
      return 'Obesity';
    }
  }

  static double calculateBMI(double height, int weight) {
    return weight / ((height / 100) * (height / 100));
  }
}
