import 'package:flutter/material.dart';

myStyle(double size, Color clr, [FontWeight? fw]) {
  return TextStyle(fontSize: size, color: clr, fontWeight: fw);
}

class MyItem {
  String img;
  String name;
  String rating;
  String distance;
  double price;

  double quantity = 1;
  double? totalPrice;

  MyItem(
    this.img,
    this.name,
    this.rating,
    this.distance,
    this.price,
  );

  static List<MyItem> generatedItem() {
    return [
      MyItem(
        'images/burgerk.png',
        'Burger King',
        '4.8',
        '800m',
        4.99,
      ),
      MyItem(
        'images/Fried.png',
        'Fried Rice',
        '4.5',
        '400m',
        3.99,
      ),
      MyItem('images/Nachos.png', 'Nachos', '4.5', '500m', 5.99),
      MyItem(
        'images/Ramen.png',
        'Ramen',
        '4.8',
        '800m',
        4.99,
      ),
      MyItem(
        'images/Salad.png',
        'Salad',
        '4.5',
        '400m',
        3.99,
      ),
      MyItem(
        'images/sandwich.png',
        'Sandwitch',
        '4.5',
        '500m',
        5.99,
      ),
      MyItem(
        'images/Stek.png',
        'Steak',
        '4.8',
        '800m',
        4.99,
      ),
    ];
  }
}

Color bgClrPri = Color(0xff272B3B);

Color bgClrSec = Color(0xffF5F5F5);

Color bgClr1 = Color(0xffEAEBEC);

Color cntClr = Color(0xffFFFFFF);

Color contClr1 = Color(0xffE4E1DE);

Color btnClr = Color(0xffF87B36);

Color btnClr1 = Color(0xff2A2F43);
