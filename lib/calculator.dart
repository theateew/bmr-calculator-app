class Calculator {
  final int height;
  final int weight;
  final int age;
  final String gender;

  Calculator({
    required this.height,
    required this.weight,
    required this.age,
    required this.gender,
  });

  // Rumus Mifflin–St Jeor:
  // Male: BMR = 10W + 6.25H - 5A + 5
  // Female: BMR = 10W + 6.25H - 5A - 161
  double calculateBMR() {
    if (gender == "male") {
      return 10 * weight + 6.25 * height - 5 * age + 5;
    } else {
      return 10 * weight + 6.25 * height - 5 * age - 161;
    }
  }

  // Daily Needs / TDEE sesuai calculator.net
  Map<String, String> calculateDailyNeeds() {
    final bmr = calculateBMR();

    return {
      "Sedentary (BMR x 1.2)": (bmr * 1.2).toStringAsFixed(0),
      "Lightly Active (BMR x 1.375)": (bmr * 1.375).toStringAsFixed(0),
      "Moderately Active (BMR x 1.55)": (bmr * 1.55).toStringAsFixed(0),
      "Very Active (BMR x 1.725)": (bmr * 1.725).toStringAsFixed(0),
      "Extra Active (BMR x 1.9)": (bmr * 1.9).toStringAsFixed(0),
    };
  }
}
