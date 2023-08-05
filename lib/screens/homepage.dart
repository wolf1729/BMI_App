import 'package:BMI_App/screens/resultpage.dart';
import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

calcBMI({required double height, required double weight}){
  height = height/100;
  double bmivalue = weight/(height*height);
  return bmivalue;
}

class _homepageState extends State<homepage> {
  double slidervalue = 100;
  double newweight  = 5.0;
  int age = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(9, 14, 33, 10),
        appBar: AppBar(
          title: Text("BMI CALCULATOR", style: TextStyle(fontSize: 20)),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(9, 14, 33, 10),
        ),
        body: Column(children: [
            SizedBox(height: 15),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                Container(
                  height: MediaQuery.of(context).size.height*0.20,
                  width: MediaQuery.of(context).size.width*0.4,
                  decoration: const BoxDecoration(color: Color.fromRGBO(14, 21, 51, 0.973),borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: const Column(
                    children: [
                      Icon(Icons.male, color: Colors.white, size: 100,),
                      Text("Male", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w300))
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height*0.20,
                  width: MediaQuery.of(context).size.width*0.4,
                  decoration: const BoxDecoration(color: Color.fromRGBO(14, 21, 51, 0.973),borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: const Column(
                    children: [
                      Icon(Icons.female, color: Colors.white, size: 100,),
                      Text("Female", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w300))
                    ],
                  )
                )
              ]),
            ),
            SizedBox(height: 20,),
            Container(
              height: MediaQuery.of(context).size.height*0.20,
              width: MediaQuery.of(context).size.width*0.87,
              decoration: const BoxDecoration(color: Color.fromRGBO(14, 21, 51, 0.973),borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                const Text("HEIGHT", style: TextStyle(color: Colors.white),),
                Text(
                  slidervalue.toString().substring(0,5),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 50
                  ),
                ),
                Slider(
                  min: 100, 
                  max: 250,
                  thumbColor: Color.fromRGBO(235, 21, 85, 10),
                  activeColor: Colors.white, 
                  value: slidervalue, onChanged: (value){
                  slidervalue = value;
                  setState(() {
                  });
                })
              ],),
            ),
            SizedBox(height: 20),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                Container(
                  height: MediaQuery.of(context).size.height*0.20,
                  width: MediaQuery.of(context).size.width*0.4,
                  decoration: const BoxDecoration(color: Color.fromRGBO(14, 21, 51, 0.973),borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("WEIGHT", style: TextStyle(color: Color.fromARGB(255, 226, 221, 221), fontSize: 20, fontWeight: FontWeight.w400)),
                      Text(
                        newweight.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 50
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                          IconButton(onPressed: (){
                            newweight++;
                            setState(() {
                            });
                          }, icon: Icon(Icons.add, color: Colors.white, size: 40,), style: ButtonStyle(),),
                          IconButton(onPressed: (){
                            newweight--;
                            setState(() {
                            });
                          }, icon: Icon(Icons.remove, color: Colors.white,size: 40,))
                        ],),
                      )
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height*0.20,
                  width: MediaQuery.of(context).size.width*0.4,
                  decoration: const BoxDecoration(color: Color.fromRGBO(14, 21, 51, 0.973),borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("AGE", style: TextStyle(color: Color.fromARGB(255, 226, 221, 221), fontSize: 20, fontWeight: FontWeight.w400)),
                      Text(
                        age.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 50
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                          IconButton(onPressed: (){
                            age++;
                            setState(() {
                            });
                          }, icon: Icon(Icons.add, color: Colors.white,size: 40,), style: ButtonStyle(),),
                          IconButton(onPressed: (){
                            age--;
                            setState(() {
                            });
                          }, icon: Icon(Icons.remove, color: Colors.white,size: 40,))
                        ],),
                      )
                    ],
                  )
                )]
              )
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: () {
                double finalBMI = calcBMI(height: slidervalue, weight: newweight);
                Navigator.push(context, MaterialPageRoute(builder: (_)=>resultpage(BMIVALUE: finalBMI)));
              },
              child: Container(
                height: MediaQuery.of(context).size.height*0.10,
                width: MediaQuery.of(context).size.width*0.87,
                decoration: const BoxDecoration(color: Color.fromRGBO(235, 21, 85, 10),borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  const Text("CALCULATE", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
                ],),
              ),
            )
          ],
        ),
      )
      );
  }
}