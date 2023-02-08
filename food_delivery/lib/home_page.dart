import 'package:flutter/material.dart';
import 'package:food_delivery/model.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:food_delivery/my_cart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final item_list = MyItem.generatedItem();
  var selected = 0;
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgClr1,
      extendBody: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Your Location',
                          style: myStyle(14, Colors.black, FontWeight.bold),
                        ),
                        Icon(
                          Icons.arrow_drop_down_sharp,
                          size: 20,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_pin,
                          size: 20,
                          color: btnClr,
                        ),
                        Text(
                          'Shibua Japan',
                          style: myStyle(20, Colors.black, FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5.0),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.search_outlined,
                            color: Colors.black,
                            size: 25,
                          )),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: Colors.blueGrey.withOpacity(0.5))),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => MyHomePage()));
                              },
                              icon: Icon(
                                Icons.shopping_cart_outlined,
                                color: Colors.black,
                                size: 25,
                              )),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: Colors.blueGrey.withOpacity(0.5))),
                        ),
                        Positioned(
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.red),
                            child: Center(
                              child: Text(
                                '3',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          right: 0,
                          top: 0,
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Lets finds the best\nfood around you',
              style: myStyle(36, bgClrPri, FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Find by Category',
                      style: myStyle(
                          24, bgClrPri.withOpacity(0.5), FontWeight.bold),
                    ),
                    Text(
                      'See All',
                      style: myStyle(18, btnClr, FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 120,
                  child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) => InkWell(
                            onTap: () {
                              setState(() {
                                selected = index;
                              });
                            },
                            child: Container(
                              height: 120,
                              width: 90,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: selected == index ? contClr1 : cntClr,
                                  border: Border.all(
                                      color: selected == index
                                          ? btnClr
                                          : Colors.transparent)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    item_list[index].img,
                                    height: 70,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${item_list[index].name}',
                                    style: myStyle(
                                        14, Colors.black, FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          )),
                      separatorBuilder: (_, index) => SizedBox(
                            width: 15,
                          ),
                      itemCount: item_list.length),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Resut(40)',
                  style:
                      myStyle(16, bgClrPri.withOpacity(0.5), FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 230,
                  child: GridView.builder(
                      // physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: item_list.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20),
                      itemBuilder: ((context, index) => Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            height: 230,
                            width: 160,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: cntClr),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  item_list[index].img,
                                  height: 70,
                                ),
                                Text(
                                  '${item_list[index].name}',
                                  style: myStyle(20, bgClrPri, FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Center(
                                      child: Row(
                                        children: [
                                          Text(
                                            '⭐',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '${item_list[index].rating}',
                                            style: myStyle(
                                                16,
                                                Colors.black.withOpacity(0.3),
                                                FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                    Center(
                                      child: Row(
                                        textBaseline: TextBaseline.alphabetic,
                                        children: [
                                          Icon(
                                            Icons.location_pin,
                                            color: Colors.pink,
                                            size: 16,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '${item_list[index].distance}',
                                            style: myStyle(
                                                16,
                                                Colors.black.withOpacity(0.3),
                                                FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '\$${item_list[index].price}',
                                      style: myStyle(
                                          20, Colors.black, FontWeight.bold),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                            top: 10,
                                          ),
                                          padding: EdgeInsets.all(1),
                                          decoration: BoxDecoration(
                                              color: bgClrPri,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight:
                                                      Radius.circular(10))),
                                          child: IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                                Icons.shopping_cart_outlined),
                                            color: Colors.white,
                                            iconSize: 18,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ))),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: FloatingNavbar(
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.black.withOpacity(0.5),
        selectedItemColor: bgClrPri,
        width: double.infinity,
        onTap: (int val) => setState(() => _index = val),
        currentIndex: _index,
        items: [
          FloatingNavbarItem(icon: Icons.home, title: 'Home'),
          FloatingNavbarItem(icon: Icons.explore_outlined, title: 'Explore'),
          FloatingNavbarItem(icon: Icons.chat_bubble_outline, title: 'Chats'),
          FloatingNavbarItem(
              icon: Icons.settings_brightness, title: 'Settings'),
          FloatingNavbarItem(icon: Icons.person_outline, title: 'Me'),
        ],
      ),
    );
  }
}
