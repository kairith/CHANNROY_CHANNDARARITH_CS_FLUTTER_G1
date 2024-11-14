import 'package:flutter/material.dart';

void main() {
  runApp(
   const MaterialApp(
      home: Scaffold(
        body : Center(
          child: Text(
           'Ronan is the best',
            style: TextStyle(
            color: Colors.orange,
            backgroundColor: Colors.black,
           ),
          ),
        )
        )
      )
  );
}