import 'package:flutter/material.dart';
import 'package:food_delivery/model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final item_list = MyItem.generatedItem();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgClr1,
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                margin: EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5.0),
                      child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                            size: 25,
                          )),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: Colors.blueGrey.withOpacity(0.5))),
                    ),
                    SizedBox(
                      width: 90,
                    ),
                    Text(
                      "My Cart",
                      style: myStyle(24, Colors.black, FontWeight.bold),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              )),
          Expanded(
              flex: 5,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ListView.builder(
                    itemCount: item_list.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(top: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: cntClr),
                        height: 150,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image(
                                      image: AssetImage(item_list[index].img)),
                                )),
                            Expanded(
                              flex: 2,
                              child: Container(
                                  margin: EdgeInsets.only(top: 15),
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item_list[index].name,
                                          style: myStyle(24, Colors.black,
                                              FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Center(
                                              child: Row(
                                                children: [
                                                  Text(
                                                    '⭐',
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    item_list[index].rating,
                                                    style: myStyle(
                                                        20,
                                                        Colors.black
                                                            .withOpacity(0.3),
                                                        FontWeight.bold),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Center(
                                              child: Row(
                                                textBaseline:
                                                    TextBaseline.alphabetic,
                                                children: [
                                                  Icon(
                                                    Icons.location_pin,
                                                    color: Colors.pink,
                                                    size: 20,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    item_list[index].distance,
                                                    style: myStyle(
                                                        18,
                                                        Colors.black
                                                            .withOpacity(0.3),
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
                                              '\$${item_list[index].totalPrice?.toStringAsFixed(2) ?? item_list[index].price}',
                                              style: myStyle(30, Colors.black,
                                                  FontWeight.bold),
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 15),
                                                  padding: EdgeInsets.only(
                                                      bottom: 10),
                                                  decoration: BoxDecoration(
                                                      color: bgClrPri,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(10),
                                                              topRight: Radius
                                                                  .circular(
                                                                      10))),
                                                  child: IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        item_list[index]
                                                                    .quantity >
                                                                1
                                                            ? item_list[index]
                                                                .quantity--
                                                            : item_list[index]
                                                                .quantity;

                                                        item_list[index]
                                                                    .totalPrice! >
                                                                item_list[index]
                                                                    .price
                                                            ? item_list[index]
                                                                .totalPrice = item_list[
                                                                        index]
                                                                    .totalPrice! -
                                                                item_list[index]
                                                                    .price
                                                                    .toDouble()
                                                            : item_list[index]
                                                                .totalPrice;

                                                        getTotalPrice();
                                                      });
                                                    },
                                                    icon: Icon(Icons.remove),
                                                    color: Colors.white,
                                                    iconSize: 25,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      '${item_list[index].quantity}',
                                                      style: myStyle(
                                                          20,
                                                          Colors.black,
                                                          FontWeight.bold),
                                                    )),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 15),
                                                  padding: EdgeInsets.only(
                                                      bottom: 10),
                                                  decoration: BoxDecoration(
                                                      color: bgClrPri,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(10),
                                                              topRight: Radius
                                                                  .circular(
                                                                      10))),
                                                  child: IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        item_list[index]
                                                            .quantity++;

                                                        item_list[index]
                                                                .totalPrice =
                                                            item_list[index]
                                                                    .price
                                                                    .toDouble() *
                                                                item_list[index]
                                                                    .quantity;

                                                        getTotalPrice();
                                                      });
                                                    },
                                                    icon: Icon(Icons.add),
                                                    color: Colors.white,
                                                    iconSize: 25,
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ])),
                            )
                          ],
                        ),
                      );
                    }),
              )),
          Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Delivery',
                          style: myStyle(24, Colors.black, FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('------------------',
                            style: myStyle(24, Colors.black, FontWeight.bold)),
                        SizedBox(
                          width: 10,
                        ),
                        Text('\$5.99',
                            style: myStyle(30, btnClr, FontWeight.bold))
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Total Order',
                          style: myStyle(24, Colors.black, FontWeight.bold),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('-------------',
                            style: myStyle(24, Colors.black, FontWeight.bold)),
                        SizedBox(
                          width: 10,
                        ),
                        Text('\$${totalAprice.toStringAsFixed(2)}',
                            style: myStyle(30, btnClr, FontWeight.bold))
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {});
                        showModalBottomSheet(
                            backgroundColor: bgClrPri,
                            isDismissible: true,
                            context: context,
                            builder: (context) => Center(
                                  child: Container(
                                    height: 200,
                                    width: 300,
                                    color: btnClr,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Thank You',
                                          style: myStyle(40, Colors.white,
                                              FontWeight.bold),
                                        ),
                                        Text(
                                          'Enjoy your Food',
                                          style: myStyle(30, Colors.white,
                                              FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                ));
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: bgClrPri),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Pay',
                              style: myStyle(30, Colors.white, FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '\$${(totalAprice + 5.99).toStringAsFixed(2)}',
                              style: myStyle(30, Colors.white, FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }

  double totalAprice = 0;
  void getTotalPrice() {
    double total = 0;
    item_list.forEach((item) {
      total += item.totalPrice ?? item.price;
    });
    setState(() {
      totalAprice = total;
      print('${totalAprice}');
    });
  }

  @override
  void initState() {
    getTotalPrice();
    super.initState();
  }
}
