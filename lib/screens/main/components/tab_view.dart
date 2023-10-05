import 'package:bad_tech/models/category.dart';
import 'package:flutter/material.dart';
import 'category_card.dart';
import 'recommended_list.dart';

class TabView extends StatelessWidget {
  List<Category> categories = [
    Category(
      Color(0xffFCE183),
      Color(0xffF68D7F),
      'Laptop',
      'assets/laptopcategory.png',
    ),
    Category(
      Color(0xffF749A2),
      Color(0xffFF7375),
      'Smartphone',
      'assets/smartphonecategory.png',
    ),
    Category(
      Color(0xff00E9DA),
      Color(0xff5189EA),
      'Hardware',
      'assets/graphicscard.png',
    ),
    Category(
      Color(0xffAF2D68),
      Color(0xff632376),
      'Accessories',
      'assets/headphone_12.png',
    ),
  ];

  final TabController tabController;

  TabView({
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height / 9);
    return TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: tabController,
        children: <Widget>[
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.all(8.0),
                    height: MediaQuery.of(context).size.height / 9,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (_, index) => CategoryCard(
                              category: categories[index],
                            ))),
                
                SizedBox(
                  height: 16.0,
                ),
                Flexible(child: RecommendedListTrend()),
              ],
            ),
          ),
          Column(children: <Widget>[
            SizedBox(
              height: 16.0,
            ),
            Flexible(child: RecommendedListLaptop())
          ]),
          Column(children: <Widget>[
            SizedBox(
              height: 16.0,
            ),
            Flexible(child: RecommendedListSmartphone())
          ]),
          Column(children: <Widget>[
            SizedBox(
              height: 16.0,
            ),
            Flexible(child: RecommendedListHardware())
          ]),
          Column(children: <Widget>[
            SizedBox(
              height: 16.0,
            ),
            Flexible(child: RecommendedListAccessory())
          ]),
        ]);
  }
}
