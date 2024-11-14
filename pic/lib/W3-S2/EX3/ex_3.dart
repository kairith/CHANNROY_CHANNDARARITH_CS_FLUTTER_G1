import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
       home : Container(
             padding: const EdgeInsets.all(10),
             margin: const  EdgeInsets.all(10),
             child:  Column(children: [
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 118, 152, 239),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text("OOP",
                  style : TextStyle(
                    color: Colors.white,fontFamily: 'Raleway',fontSize: 20,fontWeight: FontWeight.bold)),
                )
              ),
              Container(
               padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 90, 133, 242),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text("DART",
                  style : TextStyle(
                    color: Colors.white,fontFamily: 'Raleway',fontSize: 20,fontWeight: FontWeight.bold)),
                )
              ),
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                color: const Color(0xff4F7EF7),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text("FLUTTER",
                  style : TextStyle(
                         color: Colors.white,fontFamily: 'Raleway',fontSize: 20,fontWeight: FontWeight.bold)),
               )
             )
          ],)
       )
    ),
  );
}
