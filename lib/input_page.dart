import 'dart:ui';

import 'package:bmi_calculator/resultFile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'IconTextFile.dart';
import 'Container.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'calculatorFile.dart';

const ActiveColor = Colors.blue;
const deActiveColor = Colors.red;
int sliderHeight = 180;
int incrementAndDecrement = 60;
int AgeincrementAndDecrement = 20;
String mf = "";
//Enumeration
enum Gender{
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  get mainAxisAlignment => null;
  Gender selectGender;

  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
              children: [
                 //////////////////////////Frist block in the app
                Expanded(
                   
                    child: RepeatContainerCode(
                      onpressed: (){
                        setState(() {
                          selectGender = Gender.male;
                          mf = "Male";
                        });
                      },
                      colors: selectGender == Gender.male ? ActiveColor: deActiveColor,
                      cardWidget: IconTextFile(
                        icon: FontAwesomeIcons.mars,
                        label: 'Male',
                      ),
                    )),

                    /////////first small part of first block
                Expanded(
                   child: RepeatContainerCode(
                      onpressed: (){
                        setState(() {
                          selectGender = Gender.female;
                          mf = "Female";
                        });
                      },
                      colors: selectGender == Gender.female ? ActiveColor: deActiveColor,
                      cardWidget: IconTextFile(
                        icon: FontAwesomeIcons.venus,
                        label: 'female',
                      ),
                    )),
                
              ],
              
            )
            ),
            
            ///////////////////////////////////////Second block in the app
            Expanded(
                child: RepeatContainerCode(
                  colors: Colors.black,
              cardWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Height", style: TextStyle(fontSize: 25.0),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(sliderHeight.toString(), style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),),
                      Text("cm"),
                      
                  ],
                  ),
                  Slider(
                        value: sliderHeight.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        activeColor: Colors.red,
                        inactiveColor: Colors.blue,

                        onChanged: (double NewValue){
                          setState(() {
                            sliderHeight = NewValue.round();
                          });
                        },
                    ),
                ],
              ),
              
              
            ),
            
            ),
            ///////////////////////////////3rd block in the app
            Expanded(
                child: Row(
              children: [
                ///////first small block of 3rd block
                Expanded(child: RepeatContainerCode(
                  cardWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Weight", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                       SizedBox(
                            height: 25.0,
                      ),
                      Text(incrementAndDecrement.toString()),
                      SizedBox(
                            height: 25.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(onPressed: (){
                            setState(() {
                              incrementAndDecrement++;
                            });
                            
                          },
                          child: Icon(FontAwesomeIcons.plus),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          FloatingActionButton(onPressed: (){
                            setState(() {
                              incrementAndDecrement--;
                            });
                            
                          },
                          child: Icon(FontAwesomeIcons.minus),
                          ),
                        ],
                      )

                    ],
                  ),
                )),
                //////////// Second small block of the 3rd block
                Expanded(child: RepeatContainerCode(
                  cardWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Age", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                       SizedBox(
                            height: 25.0,
                      ),
                      Text(AgeincrementAndDecrement.toString()),
                      SizedBox(
                            height: 25.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(onPressed: (){
                            setState(() {
                              AgeincrementAndDecrement++;
                            });
                            
                          },
                          child: Icon(FontAwesomeIcons.plus),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          FloatingActionButton(onPressed: (){
                            setState(() {
                              AgeincrementAndDecrement--;
                            });
                            
                          },
                          child: Icon(FontAwesomeIcons.minus),
                          ),
                        ],
                      )

                    ],
                  ),
                )
                ),
                
              ],
            )
            ),
            GestureDetector(
              onTap: (){
                  CalculatorBain calcu = CalculatorBain(sliderHeight,incrementAndDecrement);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>resultScreen(
                    bmiResult: calcu.calculateBMI(),
                    bmiText: calcu.getResult(),
                    interpretation: calcu.getInterpertation(),
                  )));
              },
              child: Container(
                
                    child: Center(child: Text("Calculater", style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),)),
                    color: Colors.red,
                    margin: EdgeInsets.only(top: 10),
                    width: double.infinity,
                    height: 60.0,
            
                  ),
            )
          ],
        ));
  }
}
