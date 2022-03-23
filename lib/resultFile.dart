import 'package:flutter/material.dart';
import 'Container.dart';
import 'input_page.dart';

class resultScreen extends StatelessWidget {
    final String bmiResult;
    final String bmiText;
    final String interpretation;

    resultScreen({
      @required this.bmiResult,
      @required this.bmiText,
      @required this.interpretation
    });



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result Screen"),
        
      ),
      body: Column(
        children: [
          //////////////////////First Expanded Widget
          Expanded(child: Center(
            child: Text("Your Result", style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold
            ),),
          )),

          ////////////////////////////////Second Expanded Widget
          Expanded(
            child: RepeatContainerCode(
              colors: Colors.blue,
              cardWidget: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children:[
                  Center(child: Text(bmiText, style: TextStyle(fontSize: 30.0, color: Colors.greenAccent),)),
                  Center(child: Text(bmiResult, style: TextStyle(fontSize: 25.0, color: Colors.white),)),
                  Center(child: Text(interpretation, style: TextStyle(fontSize: 20.0, color: Colors.white),)),
                ]
              ),
          ),
          

          ),
    GestureDetector(
              onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>InputPage()));
              },
              child: Container(
                
                    child: Center(child: Text("Recalculate", style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.white ),)),
                    color: Colors.red,
                    margin: EdgeInsets.only(top: 10),
                    width: double.infinity,
                    height: 60.0,
            
                  ),
            )
          
        ],
        
      ),
      
    );
  }
}