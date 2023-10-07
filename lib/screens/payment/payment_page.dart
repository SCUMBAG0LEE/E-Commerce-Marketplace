import 'package:bad_tech/app_properties.dart';
import 'package:bad_tech/screens/product/components/color_list.dart';
import 'package:bad_tech/screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async'; // Import the async package

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  Color active = Colors.red;
  TextEditingController cardNumber = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController month = TextEditingController();
  TextEditingController cvc = TextEditingController();
  TextEditingController cardHolder = TextEditingController();

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
     scrollController.addListener(() {
    final direction = scrollController.position.userScrollDirection;
    if (direction != null && direction.index == 1) {
      FocusScope.of(context).requestFocus(FocusNode());
    }
  });
}

  //Format number card
  String convertCardNumber(String src, String divider) {
    String newStr = '';
    int step = 4;
     for (int i = 0; i < src.length; i += step) {
    final end = i + step;
    if (end <= src.length) {
      newStr += src.substring(i, end);
      if (end < src.length) {
        newStr += divider;
      }
    } else {
      // Handle the case when the remaining part is shorter than 4 digits
      newStr += src.substring(i);
    }
  }
  return newStr;
}
  //Display month and year
  String convertMonthYear(String month, String year) {
    if (month.isNotEmpty)
      return month + '/' + year;
    else
      return '';
  }

  // Method to show the "Done!" dialog and navigate to profile page
  void _showDoneDialogAndNavigateToProfile() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.done,
              color: Colors.green,
              size: 40,
            ),
            radius: 40,
          ),
          content: Text(
            "Done!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        );
      },
    );

    // Delay the navigation to the profile page by 2 seconds
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget addThisCard = InkWell(
      onTap: () {
        // Show the "Done!" dialog and navigate to profile page
        _showDoneDialogAndNavigateToProfile();
      },
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width / 1.5,
        decoration: BoxDecoration(
          gradient: mainButton,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.16),
              offset: Offset(0, 5),
              blurRadius: 10.0,
            ),
          ],
          borderRadius: BorderRadius.circular(9.0),
        ),
        child: Center(
          child: Text(
            "Add This Card",
            style: const TextStyle(
              color: const Color(0xfffefefe),
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (_, constraints) => GestureDetector(
          onPanDown: (val) {},
          behavior: HitTestBehavior.opaque,
          child: SingleChildScrollView(
            controller: scrollController,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Container(
                margin: const EdgeInsets.only(top: kToolbarHeight),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Payment',
                          style: TextStyle(
                            color: darkGrey,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        CloseButton()
                      ],
                    ),
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(32.0),
                      decoration: BoxDecoration(
                        color: active,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'CREDIT CARD',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(height: 16.0),
                          Row(
                            children: <Widget>[
                              Container(
                                height: 25,
                                width: 40,
                                color: Colors.white,
                              ),
                              Flexible(
                                child: Center(
                                  child: Text(
                                    convertCardNumber(cardNumber.text, '-'),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                convertMonthYear(month.text, year.text),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                cvc.text,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                          Spacer(),
                          Text(
                            cardHolder.text,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Colors.red,
                          Colors.blue,
                          Colors.purple[700],
                          Colors.green[700],
                          Colors.lightBlueAccent
                        ]
                            .map((c) => InkWell(
                                  onTap: () {
                                    setState(() {
                                      active = c ?? Colors.red;
                                    });
                                  },
                                  child: Transform.scale(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ColorOption(c ?? Colors.red),
                                    ),
                                    scale: active == c ? 1.2 : 1,
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16.0),
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: shadow,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(left: 16.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              color: Colors.grey[200],
                            ),
                            child: TextField(
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(16),
                              ],
                              controller: cardNumber,
                              onChanged: (val) {
                                setState(() {});
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Card Number',
                              ),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                child: Container(
                                  padding: EdgeInsets.only(left: 16.0),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    color: Colors.grey[200],
                                  ),
                                  child: TextField(
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(2),
                                    ],
                                    controller: month,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Month',
                                    ),
                                    onChanged: (val) {
                                      setState(() {});
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Flexible(
                                child: Container(
                                  padding: EdgeInsets.only(left: 16.0),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    color: Colors.grey[200],
                                  ),
                                  child: TextField(
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(2),
                                    ],
                                    controller: year,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Year',
                                    ),
                                    onChanged: (val) {
                                      setState(() {});
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Flexible(
                                child: Container(
                                  padding: EdgeInsets.only(left: 16.0),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    color: Colors.grey[200],
                                  ),
                                  child: TextField(
                                    controller: cvc,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'CVC',
                                    ),
                                    onChanged: (val) {
                                      setState(() {});
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 16.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              color: Colors.grey[200],
                            ),
                            child: TextField(
                              controller: cardHolder,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Name on card',
                              ),
                              onChanged: (val) {
                                setState(() {});
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.0),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: addThisCard,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
