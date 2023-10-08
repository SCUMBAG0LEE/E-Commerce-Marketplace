import 'package:bad_tech/app_properties.dart';
import 'package:bad_tech/models/product.dart';
import 'package:bad_tech/screens/product/components/product_card.dart';
import 'package:flutter/material.dart';

class MoreProducts extends StatelessWidget {
  final List<Product> products = [
   Product('assets/laptop_3.png', 'laptop', 'Framework Laptop', 'The Framework Laptop 13 is the best laptop for those who want full control of their experience. Everything from the processor and RAM to the keyboard and bezels is user-upgradeable.', 2400),
    Product('assets/smartphone_2.png', 'smartphone', 'Iphone 15 pro', 'Small changes can make a big difference, and all of the updates Apple made this time around to the iPhone 15 Pro and Pro Max make them the best phones you can get right now.', 1200),
    Product('assets/watch_1.png', 'accessory', 'Apple Watch Series 9','The Apple Watch Series 9 is the most well-rounded smartwatch we have tested. It has first-rate communication, fitness, health and safety features, making it the best smartwatch for most people.',399),
    Product('assets/accessory_1.png', 'accessory','Bose QuietComfort Ultra Earbuds','The Bose QuietComfort Ultra Earbuds are the company new flagship noise-canceling wireless earbuds (replacing the 2022-released QC Earbuds II). They boast improved mics for call clarity and support for spatial audio. ',299),    
    Product('assets/hardware_10.png', 'hardware', 'Thermaltake Swafan EX12 / EX14', 'Thermaltake’s Swafan EX12 and EX14 are the Burger King of case fans. These 120 or 140mm RGB fans come three to a pack and attach to each other magnetically via pins, so you only need to run a data / power cable to the first one. ', 109.99),
    Product('assets/hardware_11.png', 'hardware', 'Asus Azoth', 'At a CES with lots of keyboards, Asus’s Azoth with just a little bit extra. The wireless clacker checks all the standard boxes: space-saving 75 percent layout, RGB light show, Bluetooth / 2.4 GHz / USB-C connectivity and a customizable control wheel.', 250),
    Product('assets/accessory_6.png', 'accessory', 'PlayStation VR2', 'The PS VR2 has dual OLED panel with a 4K display resolution and 90 Hz/120 Hz frame rate. Each display has a resolution of 2,000 x 2,040 pixels. The display also supports HDR. The headset uses fresnel lenses.', 549.99),
    Product('assets/accessory_5.png', 'accessory', 'Meta Quest 2', 'The Quest 2 features fast-switching LCDs with a display resolution 1832x1920 per eye, the highest we have seen from Meta. It also has a smooth 90Hz refresh rate, which impresses for something running entirely on mobile hardware.', 299),
    Product('assets/hardware_12.png', 'hardware', 'Seagate FireCuda 8TB HDD', 'Built with serious gamers in mind, FireCuda ® HDD brings massive capacity, fast 7200-RPM speeds, ultra-large 256MB cache, and endurance for modern gaming.', 224.99),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 24.0, bottom: 8.0),
          child: Text(
            'More products',
            style: TextStyle(color: Colors.white, shadows: shadow),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 20.0),
          height: 250,
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (_, index) {
              return Padding(
                ///calculates the left and right margins
                ///to be even with the screen margin
                  padding: index == 0
                      ? EdgeInsets.only(left: 24.0, right: 8.0)
                      : index == 4
                      ? EdgeInsets.only(right: 24.0, left: 8.0)
                      : EdgeInsets.symmetric(horizontal: 8.0),
                  child: ProductCard(products[index]));
            },
            scrollDirection: Axis.horizontal,
          ),
        )
      ],
    );
  }
}
