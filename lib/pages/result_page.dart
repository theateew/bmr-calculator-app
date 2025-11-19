import 'package:flutter/material.dart';
import '../constants.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    super.key,
    required this.bmr,
    required this.dailyNeeds,
  });

  final String bmr;
  final Map<String, String> dailyNeeds;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BMR Result")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Your BMR",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),

            Text(
              "$bmr Calories/day",
              style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 30),
            const Text(
              "Daily Calorie Needs (Calculator.net):",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // List aktivitas
            Expanded(
              child: ListView(
                children: dailyNeeds.entries.map((e) {
                  return ListTile(
                    title: Text(e.key),
                    trailing: Text("${e.value} kcal"),
                  );
                }).toList(),
              ),
            ),

            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                height: 70,
                color: kBottomButtonColor,
                alignment: Alignment.center,
                child: const Text(
                  "RE-CALCULATE",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
