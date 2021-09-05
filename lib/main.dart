import 'package:flutter/material.dart';

import 'card_input_field.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CardInputField',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CardInputField cardNumberInput = CardInputField();

  @override
  void dispose() {

    /// number of controllers is 4
    cardNumberInput.controllers.forEach((element) {
      element.dispose();
    });
    super.dispose();
  }


  /// you can set value for any of inputs like below
  void setValueForAnyField(){
    cardNumberInput.controllers[0].text = '4556';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('CardInputField'),
      ),
      body: Center(
        child: cardNumberInput,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
