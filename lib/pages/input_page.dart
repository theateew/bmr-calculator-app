import 'package:flutter/material.dart';
import '../constants.dart';
import '../calculator.dart';
import 'result_page.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 170;
  int weight = 60;
  int age = 20;
  String gender = "male"; // default

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMR Calculator'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          
          // =======================
          // GENDER SELECTION
          // =======================
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => gender = "male"),
                  child: Container(
                    margin: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: gender == "male"
                          ? kBottomButtonColor
                          : kActiveCardColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("MALE", style: kLabelTextStyle),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => gender = "female"),
                  child: Container(
                    margin: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: gender == "female"
                          ? kBottomButtonColor
                          : kActiveCardColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("FEMALE", style: kLabelTextStyle),
                    ),
                  ),
                ),
              )
            ],
          ),

          // =======================
          // HEIGHT SLIDER
          // =======================
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: kActiveCardColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('HEIGHT', style: kLabelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: kNumberTextStyle),
                      const Text(' cm'),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 100,
                    max: 220,
                    onChanged: (value) {
                      setState(() => height = value.toInt());
                    },
                  ),
                ],
              ),
            ),
          ),

          // =======================
          // WEIGHT + AGE
          // =======================
          Expanded(
            child: Row(
              children: [
                // weight
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: kActiveCardColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("WEIGHT", style: kLabelTextStyle),
                        Text(weight.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () => setState(() => weight--),
                              icon: const Icon(Icons.remove),
                            ),
                            IconButton(
                              onPressed: () => setState(() => weight++),
                              icon: const Icon(Icons.add),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),

                // age
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: kActiveCardColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("AGE", style: kLabelTextStyle),
                        Text(age.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () => setState(() => age--),
                              icon: const Icon(Icons.remove),
                            ),
                            IconButton(
                              onPressed: () => setState(() => age++),
                              icon: const Icon(Icons.add),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // =======================
          // CALCULATE BUTTON
          // =======================
          GestureDetector(
            onTap: () {
              // Buat objek calculator
              final calc = Calculator(
                height: height,
                weight: weight,
                age: age,
                gender: gender,
              );

              // hitung BMR + TDEE
              final bmrValue = calc.calculateBMR();
              final needs = calc.calculateDailyNeeds();

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmr: bmrValue.toStringAsFixed(0),
                    dailyNeeds: needs,
                  ),
                ),
              );
            },
            child: Container(
              height: 70,
              color: kBottomButtonColor,
              alignment: Alignment.center,
              child: const Text(
                'CALCULATE BMR',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
