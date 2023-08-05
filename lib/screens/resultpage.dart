import 'package:flutter/material.dart';

class resultpage extends StatelessWidget {
  final double BMIVALUE;
   resultpage({Key? key, required this.BMIVALUE}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("BMI CALCULATOR", style: TextStyle(fontSize: 20)),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(9, 14, 33, 10),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Color.fromRGBO(9, 14, 33, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Text("YOUR BMI IS", style: TextStyle(color: Colors.white, fontSize: 20),),
            Text("${BMIVALUE}", style: TextStyle(color: Colors.white, fontSize: 80, fontWeight: FontWeight.w900),)

          ]),
        ),
      ),
    );
  }
}