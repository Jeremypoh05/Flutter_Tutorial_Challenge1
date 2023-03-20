import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: BallPage(),
    ),
  );
}

class BallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ask Me Anything',
            style: TextStyle(
              fontFamily: 'LilitaOne',
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            )
        ),
        centerTitle: true,
        elevation: 1,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.blue],
              // Set the colors for the gradient
              begin: Alignment.topLeft,
              // Set the starting point of the gradient
              end:
                  Alignment.bottomRight, // Set the ending point of the gradient
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          //set linear gradient for the background app
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.purple,
              Colors.blue,
            ],
          ),
        ),
        child: Ball(), //call the Ball class
      ),
    );
  }
}

class Ball extends StatefulWidget {
  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNumber = 1; //initialize the ballNumber equal to 1

  //the function for changing the ballNumber randomly once it is being clicked.
  void changeBallNumber() {
    int newBallNumber;
    //using do-while loop to make sure the randomize ball number will not same as current ball number.
    do {
      newBallNumber = Random().nextInt(5) + 1;
      //in the range of 1 to 5 when we want to use the result as an index in an array of 5 elements. If "nextInt(6)" might get IndexOutOfBounds error.
    } while (newBallNumber == ballNumber);
    setState(() {
      ballNumber = newBallNumber;
    });
    print("The ball number gets pressed: $ballNumber");
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      //GestureDetector is a more general-purpose widget that can detect a wide range of user gestures like taps, double-taps, long presses, drags and scrolls.
      child: GestureDetector(
        onTap: () {
          //trigger the function when it is tap or click
          changeBallNumber();
        },
        child: Container(
          decoration: const BoxDecoration(
            //add some box shadow effect to the image
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0, 15),
              ),
            ],
          ),
          padding: const EdgeInsets.all(30.0),
          child: Image.asset('assets/ball$ballNumber.png'),
        ),
      ),
    );
  }
}
