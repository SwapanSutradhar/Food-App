import 'package:flutter/material.dart';
import 'package:food_delivery/home_page.dart';
import 'package:food_delivery/model.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: bgClrPri,
          ),
          Positioned(
            child: Image.asset(
              'images/home.png',
              height: 250,
              width: 350,
            ),
            left: -40,
            top: 30,
          ),
          Positioned(
            child: Text(
              'Grab your\nDelicious food!',
              style: myStyle(50, Colors.white, FontWeight.bold),
            ),
            top: 280,
            left: 20,
          ),
          Positioned(
            child: Text(
              'Delivery food in your phone',
              style:
                  myStyle(22, Colors.white.withOpacity(0.9), FontWeight.bold),
            ),
            left: 20,
            bottom: 270,
          ),
          Positioned(
            child: Row(
              children: [
                Container(
                  height: 7,
                  width: 63,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 7,
                  width: 53,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.withOpacity(0.5)),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 7,
                  width: 53,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.withOpacity(0.5)),
                ),
              ],
            ),
            left: 20,
            bottom: 220,
          ),
          Positioned(
            child: InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: btnClr),
                child: Center(
                    child: Text(
                  'Get Started',
                  style: myStyle(24, Colors.white, FontWeight.bold),
                )),
              ),
            ),
            right: 20,
            left: 20,
            bottom: 40,
          )
        ],
      ),
    );
  }
}
