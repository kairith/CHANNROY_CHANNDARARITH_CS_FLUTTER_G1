import 'package:flutter/material.dart';


 class CustomCard extends StatelessWidget {
  final String text;
  final Color color;
  // positional argument
  const CustomCard(this.color , this.text , {super.key});
   
  @override
  Widget build(BuildContext context) {
    return Container(
             padding: const EdgeInsets.all(10),
             margin: const  EdgeInsets.all(10),
             child:  Column(children: [
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(text,
                  style : const TextStyle(
                    
                    color: Colors.white,fontFamily: 'Raleway',fontSize: 20,fontWeight: FontWeight.bold ,)
                     ,
                    ),
                )
             )
          ]
        )
      )
     ;
  }
}


void main(){
     runApp(const MaterialApp(
      home : Column(
        children: [
          // position
          CustomCard(Color.fromARGB(255, 109, 182, 237), "OOP"),
          CustomCard(Color.fromARGB(255, 72, 171, 238), "Dart"),
          CustomCard(Color.fromARGB(255, 43, 154, 228), "FLUTTER"),
        ],
      )
     )
     );
}