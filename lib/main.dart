import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;
  LiquidController liquidController = LiquidController();

  final pages = [
    Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Image.asset(
              "assets/logo-2.png",
              height: 800,
              width: 800,
            ),
          ),
        ],
      ),
    ),
    SingleChildScrollView(
      child: Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Image.asset(
                "assets/l2.png",
                height: 900,
                width: 600,
              ),
            ),
          ],
        ),
      ),
    ),
    Container(
      width: double.infinity,
      color: Colors.white,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: Image.asset(
                  "assets/l-3.png",
                  height: 800,
                  width: 800,
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 30, // Adjust the position from the bottom as needed
            right: 10, // Adjust the position from the right as needed
            child: GestureDetector(
                onTap: () {
                  // Add the action you want to perform when the button is tapped
                },
                child: Container(
                  width: 60, // Adjust the size of the button as needed
                  height: 50, // Adjust the size of the button as needed
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.rectangle, // Use a rectangle shape
                    borderRadius: BorderRadius.circular(
                        20.0), // Adjust the border radius for soft edges
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 30,
                  ),
                )),
          ),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LiquidSwipe(
          pages: pages,
          enableLoop: false,
          slideIconWidget: Icon(Icons.arrow_back_ios_new),
          positionSlideIcon: 0.5,
          fullTransitionValue: 100,
          waveType: WaveType.liquidReveal,
          onPageChangeCallback: (page) {
            setState(() {
              currentIndex = page;
            });
          },
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(
              bottom: 20), // Adjust the margin to move the dots upwards
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: pages.map<Widget>((page) {
              int index = pages.indexOf(page);
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                width: 10,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndex == index
                      ? Colors.black // Active dot color
                      : Colors.grey, // Inactive dot color
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
