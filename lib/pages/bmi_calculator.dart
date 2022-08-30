import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testapp1/allpages.dart';
import 'package:testapp1/pages/homepage.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  final _footController = TextEditingController();
  final _inchController = TextEditingController();

  // the controller for the text field associated with "weight"
  final _weightController = TextEditingController();

  double? _bmi;
  // the message at the beginning
  String _message =
      'Please enter your height in foot and inches in respective boxes';

  // This function is triggered when the user pressess the "Calculate" button
  void _calculate() {
    final double? height = (double.tryParse(_footController.value.text)! +
            (double.tryParse(_footController.value.text)!) / 12) /
        3.281;
    final double? weight = double.tryParse(_weightController.value.text);

    // Check if the inputs are valid
    if (height == null || height <= 0 || weight == null || weight <= 0) {
      setState(() {
        _message = "Your height and weigh must be positive numbers";
      });
      return;
    }

    setState(() {
      _bmi = weight / (height * height);
      if (_bmi! < 18.5) {
        _message =
            "You are underweight Try:\n 1. Avoiding food with added sugar, fat and salt.\n 2. Eating small frequent meals.\n 3. Eating high calorie food and fruits.";
      } else if (_bmi! < 25) {
        _message = 'You body is fine. Keep eating healthy.';
      } else if (_bmi! < 30) {
        _message =
            'You are overweight Try:\n 1. Loosing weight through healthy eating habit.\n 2. Being more physically active\n 3. Modifying your lifestyle.';
      } else {
        _message =
            'You are obese. Consult a doctor or else you may face severe health complexities in future';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 50,
        elevation: 0,
        backgroundColor: const Color(0xff0984e3),
        title: const Text(
          'BMI Calculator',
          style: const TextStyle(
            fontFamily: 'SuezOne',
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: drkmd == true ? Colors.grey[900] : Colors.grey[100],
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: drkmd == true ? HexColor('#444444') : HexColor('#dfe6e9'),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child: TextField(
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: false),
                          controller: _footController,
                          style: TextStyle(
                            color:
                                drkmd == true ? Colors.white : Colors.grey[600],
                          ),
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(40),
                                right: Radius.circular(40),
                              ),
                              borderSide:
                                  BorderSide(color: Colors.red, width: 5.0),
                            ),
                            labelText: 'Foot',
                            labelStyle: TextStyle(
                              color: drkmd == true
                                  ? Colors.white
                                  : Colors.grey[600],
                            ),
                            prefixIcon: Icon(
                              Icons.man_outlined,
                              color: drkmd == true
                                  ? Colors.white
                                  : Colors.grey[600],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          width: 10,
                        ),
                      ),
                      Expanded(
                        flex: 7,
                        child: TextField(
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: false),
                          controller: _inchController,
                          style: TextStyle(
                            color:
                                drkmd == true ? Colors.white : Colors.grey[600],
                          ),
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(40),
                                right: Radius.circular(40),
                              ),
                              borderSide:
                                  BorderSide(color: Colors.red, width: 5.0),
                            ),
                            labelText: 'Inches',
                            labelStyle: TextStyle(
                              color: drkmd == true
                                  ? Colors.white
                                  : Colors.grey[600],
                            ),
                            prefixIcon: Icon(
                              Icons.man_outlined,
                              color: drkmd == true
                                  ? Colors.white
                                  : Colors.grey[600],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    style: TextStyle(
                      color: drkmd == true ? Colors.white : Colors.grey[600],
                    ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    controller: _weightController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(40),
                          right: Radius.circular(40),
                        ),
                        borderSide: BorderSide(color: Colors.red, width: 5.0),
                      ),
                      labelText: 'Weight(kg)',
                      labelStyle: TextStyle(
                        color: drkmd == true ? Colors.white : Colors.grey[600],
                      ),
                      prefixIcon: Icon(
                        Icons.add,
                        color: drkmd == true ? Colors.white : Colors.grey[600],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      _message,
                      style: TextStyle(
                        color: drkmd == true ? Colors.white : Colors.grey[600],
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xff0984e3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                        child: Text(
                          'Calculate',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Nunito',
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    onPressed: _calculate,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'What exactly is Body Mass Index?',
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      color: drkmd == true
                          ? HexColor('#bebebe')
                          : HexColor('#636e72'),
                      // fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Body Mass Index(BMI) is a person\'s weight in kilogram divided by the square of height in meters. A high BMI can indicate high body fatness. BMI screens for weight categories that may lead to health problems, but it does not diagnose the body fatness or health of an individual.',
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      color: drkmd == true
                          ? HexColor('#bebebe')
                          : HexColor('#636e72'),
                      // fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
