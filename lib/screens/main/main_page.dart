import 'package:bad_tech/app_properties.dart';
import 'package:bad_tech/custom_background.dart';
import 'package:bad_tech/models/product.dart';
import 'package:bad_tech/screens/category/category_list_page.dart';
import 'package:bad_tech/screens/notifications_page.dart';
import 'package:bad_tech/screens/profile_page.dart';
import 'package:bad_tech/screens/search_page.dart';
import 'package:bad_tech/screens/shop/check_out_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'components/custom_bottom_bar.dart';
import 'components/product_list.dart';
import 'components/tab_view.dart';

class MainPage extends StatefulWidget {
  
  @override
  _MainPageState createState() => _MainPageState();
}

List<String> timelines = ['Weekly featured', 'Best of August', 'Best of 2023'];
String selectedTimeline = 'Weekly featured';

List<Product> products = [
  Product(
      'assets/laptop_1.png',
      'laptop',
      'Zenbook Pro 14 Duo OLED',
      'Using Asus ScreenXpert software, Zenbook Pro Duo users essentially have a small, crisp secondary OLED monitor on their keyboard deck. This second screen can also be turned into a giant touchpad (which is helpful since the actual touchpad the device comes with is pretty tiny. The device also comes with high-performance chips from Intel and Nvidia, and a roomy 16:10 primary screen. While the keyboard-in-the-front layout won’t be for everyone, this innovative device is the best choice for shoppers who want multiple screens in one.',
      1800),
  Product(
      'assets/phone_1.png',
      'smartphone',
      'Poco F5 5G',
      'Despite weighing just over 180 grams, it sports a massive 6.67-inch AMOLED display and measures 7.98 mm at its thickest. All the physical buttons are mounted on the right bezel, with the power button doubling up as a fingerprint sensor.',
      359),
  Product(
      'assets/watch_1.png',
      'accesory',
      'Apple Watch Series 9',
      'The Apple Watch Series 9 is the most well-rounded smartwatch we have tested. It has first-rate communication, fitness, health and safety features, making it the best smartwatch for most people.',
      399),
];

class _MainPageState extends State<MainPage>
    with TickerProviderStateMixin<MainPage> {
  late TabController tabController;
  late TabController bottomTabController;
  List<Product> selectedProducts = [];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
    bottomTabController = TabController(length: 4, vsync: this);
    List<Product> selectedProducts = [];
  }

  @override
  Widget build(BuildContext context) {
    Widget appBar = Container(
      height: kToolbarHeight + MediaQuery.of(context).padding.top,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => NotificationsPage())),
              icon: Icon(Icons.notifications)),
          IconButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => SearchPage())),
              icon: SvgPicture.asset('assets/icons/search_icon.svg'))
        ],
      ),
    );

    Widget topHeader = Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Flexible(
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedTimeline = timelines[0];
                    products = [
                     Product(
                        'assets/laptop_1.png',
                        'laptop',
                        'Zenbook Pro 14 Duo OLED',
                        'Using Asuss ScreenXpert software, Zenbook Pro Duo users essentially have a small, crisp secondary OLED monitor on their keyboard deck. This second screen can also be turned into a giant touchpad (which is helpful since the actual touchpad the device comes with is pretty tiny. The device also comes with high-performance chips from Intel and Nvidia, and a roomy 16:10 primary screen. While the keyboard-in-the-front layout won’t be for everyone, this innovative device is the best choice for shoppers who want multiple screens in one.',
                        1800),
                    Product(
                        'assets/phone_1.png',
                        'smartphone',
                        'Poco F5 5G',
                        'Despite weighing just over 180 grams, it sports a massive 6.67-inch AMOLED display and measures 7.98 mm at its thickest. All the physical buttons are mounted on the right bezel, with the power button doubling up as a fingerprint sensor.',
                        359),
                    Product(
                        'assets/watch_1.png',
                        'accessory',
                        'Apple Watch Series 9',
                        'The Apple Watch Series 9 is the most well-rounded smartwatch we have tested. It has first-rate communication, fitness, health and safety features, making it the best smartwatch for most people.',
                        399),
                    ];
                  });
                },
                child: Text(
                  timelines[0],
                  style: TextStyle(
                      fontSize: timelines[0] == selectedTimeline ? 20 : 14,
                      color: darkGrey),
                ),
              ),
            ),
            Flexible(
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedTimeline = timelines[1];
                    products = [
                      Product(
                          'assets/accessory_1.png',
                          'accessory',
                          'Bose QuietComfort Ultra Earbuds',
                          'The Bose QuietComfort Ultra Earbuds are the company new flagship noise-canceling wireless earbuds (replacing the 2022-released QC Earbuds II). They boast improved mics for call clarity and support for spatial audio. ',
                          299),
                      Product(
                          'assets/accessory_2.png',
                          'accessory',
                          'Amazon Echo Frames (3rd-Gen)',
                          'Like their predecessors, Amazon newest Echo Frames work as a combo of eyeglasses (or sunglasses) and headphones — there are speakers built into each arm. The third-generation Echo Frames have improved sound, faster Alexa and come in a number of stylish frames.',
                          270),
                      Product(
                          'assets/accessory_3.png',
                          'accessory',
                          'Sony WH-CH520',
                          'The Sony WH-CH520 are the new super cheap, on-ear wireless headphones from Sony. These headphones are on-ear rather than in-ear or over-ear, which means you wont get active noise cancellation or Hi-Res Audio support but you wouldnt expect to at this price, but they deliver quality, well-balanced sound (as well as a few useful tricks), making them fantastic value and our favorite pair of cheap on-ears.',
                          65),
                    ];
                  });
                },
                child: Text(timelines[1],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: timelines[1] == selectedTimeline ? 20 : 14,
                        color: darkGrey)),
              ),
            ),
            Flexible(
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedTimeline = timelines[2];
                    products = [
                      Product(
                          'assets/smartphone_1.png',
                          'smartphone',
                          'Samsung Galaxy A14 5G',
                          "So what is new? For starters, the design is more in line with the rest of Samsung's phones and uses the same 'camera island' style we've seen on the Galaxy S23 series. The entire phone feels a bit sturdier in hand, and the engrained pattern on the back is pretty eye-catching in this price range. Even better, the display received a huge upgrade to 1080p while keeping its 90Hz refresh rate. It's still an LCD panel — you'll need to grab the A54 for AMOLED — but for \$200, it's hard to argue with the screen quality here.",
                          195.0),
                      Product(
                          'assets/laptop_2.png',
                          'laptop',
                          'Lenovo IdeaPad Windows Duet 5i',
                          'Lenovos IdeaPad Windows Duet 5i is an affordable, well-rounded alternative to premium 2-in-1 laptops, featuring surprising performance for the price. With a sturdy build, an intuitive detachable design, a sharp 2.5K display, and a keyboard included, this detachable is perfect for grab-and-go use, whether its for productivity or entertainment. This all amounts to an impressive value for its price.',
                          529.99),
                      Product(
                          'assets/hardware_1.png',
                          'hardware',
                          'NVIDIA GeForce RTX 4060',
                          'The RTX 4060 doesn’t set the world alight when stacked up against its NVIDIA counterparts. Healthy upgrades to both base and boost clocks are a nice addition but reductions to both VRAM and CUDA cores will likely cancel out these upgrades.',
                          300.0),
                    ];
                  });
                },
                child: Text(timelines[2],
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: timelines[2] == selectedTimeline ? 20 : 14,
                        color: darkGrey)),
              ),
            ),
          ],
        ));
        

    Widget tabBar = TabBar(
      tabs: [
        Tab(text: 'Trending'),
        Tab(text: 'Laptop'),
        Tab(text: 'Smartphone'),
        Tab(text: 'Hardware'),
        Tab(text: 'Accessory'),
      ],
      labelStyle: TextStyle(fontSize: 16.0),
      unselectedLabelStyle: TextStyle(
        fontSize: 14.0,
      ),
      labelColor: darkGrey,
      unselectedLabelColor: Color.fromRGBO(0, 0, 0, 0.5),
      isScrollable: true,
      controller: tabController,
    );

    return Scaffold(
      bottomNavigationBar: CustomBottomBar(controller: bottomTabController),
      body: CustomPaint(
        painter: MainBackground(),
        child: TabBarView(
          controller: bottomTabController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            SafeArea(
              child: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  // These are the slivers that show up in the "outer" scroll view.
                  return <Widget>[
                    SliverToBoxAdapter(
                      child: appBar,
                    ),
                    SliverToBoxAdapter(
                      child: topHeader,
                    ),
                    SliverToBoxAdapter(
                      child: ProductList(
                        products: products,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: tabBar,
                    )
                  ];
                },
                body: TabView(
                  tabController: tabController,
                ),
              ),
            ),
            CategoryListPage(),
            CheckOutPage(selectedProducts: selectedProducts),
            ProfilePage()
          ],
        ),
      ),
    );
  }
}
