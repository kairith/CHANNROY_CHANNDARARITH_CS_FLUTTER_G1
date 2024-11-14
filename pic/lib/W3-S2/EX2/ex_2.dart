import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          
          color: Colors.blue,
          margin: const EdgeInsets.all(90),
          padding: const EdgeInsets.all(90),
          child: Container(
            
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 21, 119, 189), // Inner container color
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Center(
              child: Text(
                'CADT STUDENT',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

