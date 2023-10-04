import 'package:bad_tech/app_properties.dart';
import 'package:bad_tech/models/product.dart';
import 'package:bad_tech/screens/product/product_page.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';

class RecommendedListTrend extends StatelessWidget {
  List<Product> products = [
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
      children: <Widget>[
        SizedBox(
          height: 20,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              IntrinsicHeight(
                child: Container(
                  margin: const EdgeInsets.only(left: 16.0, right: 8.0),
                  width: 4,
                  color: mediumYellow,
                ),
              ),
              Center(
                  child: Text(
                'Recommended',
                style: TextStyle(
                    color: darkGrey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              )),
            ],
          ),
        ),
        Flexible(
          child: Container(
            padding: EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
            child: MasonryGridView.count(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              crossAxisCount: 4,
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) => new ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => ProductPage(product: products[index]))),
                  child: Container(
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                            colors: [
                              Colors.grey.withOpacity(0.3),
                              Colors.grey.withOpacity(0.7),
                            ],
                            center: Alignment(0, 0),
                            radius: 0.6,
                            focal: Alignment(0, 0),
                            focalRadius: 0.1),
                      ),
                      child: Hero(
                          tag: products[index].image,
                          child: Image.asset(products[index].image))),
                ),
              ),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            ),
          ),
        ),
      ],
    );
  }
}

class RecommendedListLaptop extends StatelessWidget {
  List<Product> products = [
    Product('assets/laptop_3.png', 'laptop', 'Framework Laptop', 'The Framework Laptop 13 is the best laptop for those who want full control of their experience. Everything from the processor and RAM to the keyboard and bezels is user-upgradeable.', 2400.00),
    Product('assets/laptop_1.png', 'laptop', 'Zenbook Pro 14 Duo OLED','Using Asus ScreenXpert software, Zenbook Pro Duo users essentially have a small, crisp secondary OLED monitor on their keyboard deck. This second screen can also be turned into a giant touchpad (which is helpful since the actual touchpad the device comes with is pretty tiny. The device also comes with high-performance chips from Intel and Nvidia, and a roomy 16:10 primary screen. While the keyboard-in-the-front layout won’t be for everyone, this innovative device is the best choice for shoppers who want multiple screens in one.',1800),    
    Product('assets/laptop_2.png', 'laptop','Lenovo IdeaPad Windows Duet 5i','Lenovos IdeaPad Windows Duet 5i is an affordable, well-rounded alternative to premium 2-in-1 laptops, featuring surprising performance for the price. With a sturdy build, an intuitive detachable design, a sharp 2.5K display, and a keyboard included, this detachable is perfect for grab-and-go use, whether its for productivity or entertainment. This all amounts to an impressive value for its price.',529.99),
    Product('assets/laptop_4.png', 'laptop', 'Dell XPS 13','The Dell XPS 13 has long been one of the top recommendations for Windows users looking for a MacBook Air alternative.', 599),
    Product('assets/laptop_5.png', 'laptop', 'Asus Zenbook S 13 OLED', 'Worlds lightest 13.3” 2.8K OLED laptop. 16:10, 2.8K (2880 x 1800) high resolution, OLED NanoEdge touchscreen, 0.2 ms response time, 100% DCI-P3 color gamut', 1399),
    Product('assets/laptop_6.png', 'laptop', 'Lenovo Chromebook Duet 3', 'The Lenovo Chromebook Duet 3 is a great, tiny laptop for budget shoppers. It comes with a magnetic detachable keyboard that’s a breeze to pop on and off. The screen also supports USI styluses, though a stylus is not included in the price. The keyboard is included in the price, however, as is the magnetic back cover and kickstand.', 319),
    Product('assets/laptop_7.png', 'laptop', 'Microsoft Surface Laptop 5', 'Multitasking speed powered by 12th Gen Intel® Core™ i5/i7 processors built on the Intel® Evo™ platform, with Windows 11 and a vibrant touchscreen. Sleek and beautiful, in your choice of size.¹ And battery life² for real life to do your thing your way all day. Surface Laptop 5 gives you the perfect balance to do it all.', 1899),
    Product('assets/laptop_8.png', 'laptop', 'Razer Blade 16', 'The Razer Blade 16 is the best laptop for playing the most demanding games on the market, offering a 16-inch Mini LED display, an RGB keyboard, and hardcore chips from Intel and Nvidia. It’s just not cheap.', 5999),
    Product('assets/laptop_9.png', 'laptop', 'HP Dragonfly Pro ', 'The HP Elite Dragonfly Pro is one of the best business laptops for freelancers and self-employed customers. It performs quite well and comes with extra service.', 1550),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              IntrinsicHeight(
                child: Container(
                  margin: const EdgeInsets.only(left: 16.0, right: 8.0),
                  width: 4,
                  color: mediumYellow,
                ),
              ),
              Center(
                  child: Text(
                'Recommended',
                style: TextStyle(
                    color: darkGrey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              )),
            ],
          ),
        ),
        Flexible(
          child: Container(
            padding: EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
            child: MasonryGridView.count(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              crossAxisCount: 4,
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) => new ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => ProductPage(product: products[index]))),
                  child: Container(
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                            colors: [
                              Colors.grey.withOpacity(0.3),
                              Colors.grey.withOpacity(0.7),
                            ],
                            center: Alignment(0, 0),
                            radius: 0.6,
                            focal: Alignment(0, 0),
                            focalRadius: 0.1),
                      ),
                      child: Hero(
                          tag: products[index].image,
                          child: Image.asset(products[index].image))),
                ),
              ),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            ),
          ),
        ),
      ],
    );
  }
}

class RecommendedListSmartphone extends StatelessWidget {
  List<Product> products = [
    Product('assets/smartphone_2.png', 'smartphone', 'Iphone 15 pro', 'Small changes can make a big difference, and all of the updates Apple made this time around to the iPhone 15 Pro and Pro Max make them the best phones you can get right now.', 1200),
    Product('assets/phone_1.png', 'smartphone','Poco F5 5G','Despite weighing just over 180 grams, it sports a massive 6.67-inch AMOLED display and measures 7.98 mm at its thickest. All the physical buttons are mounted on the right bezel, with the power button doubling up as a fingerprint sensor.',359),
    Product('assets/smartphone_1.png', 'smartphone', 'Samsung Galaxy A14 5G',"So what is new? For starters, the design is more in line with the rest of Samsung's phones and uses the same 'camera island' style we've seen on the Galaxy S23 series. The entire phone feels a bit sturdier in hand, and the engrained pattern on the back is pretty eye-catching in this price range. Even better, the display received a huge upgrade to 1080p while keeping its 90Hz refresh rate. It's still an LCD panel — you'll need to grab the A54 for AMOLED — but for \$200, it's hard to argue with the screen quality here.",195.0),
    Product('assets/smartphone_3.png', 'smartphone', 'Samsung Galaxy S23 Ultra','The Galaxy S23 Ultra has every feature power users and more mainstream Android users could ever need.', 1200),
    Product('assets/smartphone_4.png', 'smartphone', 'Google Pixel 7 Pro', 'Pixels newest powerful processor is custom built with Google AI and makes Pixel 7 Pro faster, more efficient, and more secure.', 699),
    Product('assets/smartphone_5.png', 'smartphone', 'Samsung Galaxy Z Flip 5', 'With the Galaxy Z Flip 5, Samsung brought a larger external display that’s more functional than previous generations, and an improved hinge.', 1000),
    Product('assets/smartphone_6.png', 'smartphone', 'Asus ROG Phone 7 Ultimate', 'The mighty ROG Phone 7 Ultimate is built without compromises, unleashing the awesome gaming power of the flagship 3.2 GHz Snapdragon ® 8 Gen 2 Mobile Platform', 1399),
    Product('assets/smartphone_7.png', 'smartphone', 'Asus ROG Phone 6 Pro', 'The ROG Phone 6 Pro is the latest incarnation of world-beating gaming phone. It harnesses the brute gaming power of the latest Qualcomm® Snapdragon® 8+ Gen', 1515),
    Product('assets/smartphone_8.png', 'smartphone', 'OnePlus 11 5G', 'The phone comes with a 120 Hz refresh rate 6.70-inch touchscreen display offering a resolution of 1440x3216 pixels (QHD+) at a pixel density of 525 pixels per inch (ppi)', 799),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              IntrinsicHeight(
                child: Container(
                  margin: const EdgeInsets.only(left: 16.0, right: 8.0),
                  width: 4,
                  color: mediumYellow,
                ),
              ),
              Center(
                  child: Text(
                'Recommended',
                style: TextStyle(
                    color: darkGrey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              )),
            ],
          ),
        ),
        Flexible(
          child: Container(
            padding: EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
            child: MasonryGridView.count(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              crossAxisCount: 4,
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) => new ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => ProductPage(product: products[index]))),
                  child: Container(
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                            colors: [
                              Colors.grey.withOpacity(0.3),
                              Colors.grey.withOpacity(0.7),
                            ],
                            center: Alignment(0, 0),
                            radius: 0.6,
                            focal: Alignment(0, 0),
                            focalRadius: 0.1),
                      ),
                      child: Hero(
                          tag: products[index].image,
                          child: Image.asset(products[index].image))),
                ),
              ),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            ),
          ),
        ),
      ],
    );
  }
}

class RecommendedListHardware extends StatelessWidget {
  List<Product> products = [
    Product('assets/hardware_1.png', 'hardware', 'NVIDIA GeForce RTX 4060','The RTX 4060 doesnt set the world alight when stacked up against its NVIDIA counterparts. Healthy upgrades to both base and boost clocks are a nice addition but reductions to both VRAM and CUDA cores will likely cancel out these upgrades.',300.0),
    Product('assets/hardware_2.png', 'hardware', 'MSI MPG A850GF 850W Power Supply ', 'With solid construction and great internal components and performance, the MSI MPG A850GF 850W is a great power supply enthusiast PC builds that demand only the best.', 179),
    Product('assets/hardware_3.png', 'hardware', 'WD_Black SN770 1 TB SSD', 'The WD_Black SN770 is an excellent value that future-proofs any PCIe 4 compatible rig and will deliver fantastic load speeds as we wait for Directstorage adoption.', 129.99),
    Product('assets/hardware_4.png', 'hardware', 'ASUS ROG Strix B550i Gaming Motherboard','Delivering performance and style in a small form factor, the ASUS ROG Strix B550i is the AMD Ryzen Mini ITX builder’s dream come true.', 279.99),
    Product('assets/hardware_5.png', 'hardware', 'AMD Ryzen 7 7800X3D ', 'AMDs new X3D family brings the more modern Zen 4 architecture and broadens the stack out to 8-, 12- and 16-core models.', 450),
    Product('assets/hardware_6.png', 'hardware', 'Asus Swift Pro PG248QP', 'The 24.1-inch Asus ROG Swift Pro PG248QP is a 1080p monitor thats designed for serious gamers. The PG248QP has an overclocked E-TN panel ', 899),
    Product('assets/hardware_7.png', 'hardware', 'ViewSonic VX16-OLED', 'The portable monitor grabbed our attention due to it cramming a 4K resolution into a 15.6-inch form-factor, but as its name implies, it also uses an OLED panel.', 400),
    Product('assets/hardware_8.png', 'hardware', 'Hyte Y40', 'Hytes Y40 is an attractive case with loads of attention to detail, and its already on sale for \$149, in your choice of white, black or red.', 149),
    Product('assets/hardware_9.png', 'hardware', 'Razer Kiyo Pro Ultra', 'The Kiyo Pro Ultra also uses AI-powered face tracking to keep your face centered. And it has an onboard processor for transcoding video on the fly.', 299.99),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              IntrinsicHeight(
                child: Container(
                  margin: const EdgeInsets.only(left: 16.0, right: 8.0),
                  width: 4,
                  color: mediumYellow,
                ),
              ),
              Center(
                  child: Text(
                'Recommended',
                style: TextStyle(
                    color: darkGrey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              )),
            ],
          ),
        ),
        Flexible(
          child: Container(
            padding: EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
            child: MasonryGridView.count(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              crossAxisCount: 4,
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) => new ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => ProductPage(product: products[index]))),
                  child: Container(
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                            colors: [
                              Colors.grey.withOpacity(0.3),
                              Colors.grey.withOpacity(0.7),
                            ],
                            center: Alignment(0, 0),
                            radius: 0.6,
                            focal: Alignment(0, 0),
                            focalRadius: 0.1),
                      ),
                      child: Hero(
                          tag: products[index].image,
                          child: Image.asset(products[index].image))),
                ),
              ),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            ),
          ),
        ),
      ],
    );
  }
}

class RecommendedListAccessory extends StatelessWidget {
  List<Product> products = [
    Product('assets/watch_1.png', 'accessory', 'Apple Watch Series 9','The Apple Watch Series 9 is the most well-rounded smartwatch we have tested. It has first-rate communication, fitness, health and safety features, making it the best smartwatch for most people.',399),
    Product('assets/accessory_1.png', 'accessory', 'Bose QuietComfort Ultra Earbuds','The Bose QuietComfort Ultra Earbuds are the company new flagship noise-canceling wireless earbuds (replacing the 2022-released QC Earbuds II). They boast improved mics for call clarity and support for spatial audio. ',299),
    Product('assets/accessory_2.png', 'accessory', 'Amazon Echo Frames (3rd-Gen)','Like their predecessors, Amazon newest Echo Frames work as a combo of eyeglasses (or sunglasses) and headphones — there are speakers built into each arm. The third-generation Echo Frames have improved sound, faster Alexa and come in a number of stylish frames.',270),
    Product('assets/accessory_3.png', 'accessory', 'Sony WH-CH520','The Sony WH-CH520 are the new super cheap, on-ear wireless headphones from Sony. These headphones are on-ear rather than in-ear or over-ear, which means you wont get active noise cancellation or Hi-Res Audio support but you wouldnt expect to at this price, but they deliver quality, well-balanced sound (as well as a few useful tricks), making them fantastic value and our favorite pair of cheap on-ears.',65),
    Product('assets/accessory_4.png', 'accessory', 'Nreal Air AR Glasses', 'Nreal Air AR Glasses specs: Weight: 2.79 ounces | Dimensions: 5.83 x 2.36 x 2.05 inches | Battery life: Not based on the glasses, but on the Nreal adapter or phone the glasses are plugged into | Works with: Devices on the compatibility list | Prescriptions lens: Prescription lens compatible', 379),
    Product('assets/accessory_5.png', 'accessory', 'Meta Quest 2', 'The Quest 2 features fast-switching LCDs with a display resolution 1832x1920 per eye, the highest we have seen from Meta. It also has a smooth 90Hz refresh rate, which impresses for something running entirely on mobile hardware.', 299),
    Product('assets/accessory_6.png', 'accessory', 'PlayStation VR2', 'The PS VR2 has dual OLED panel with a 4K display resolution and 90 Hz/120 Hz frame rate. Each display has a resolution of 2,000 x 2,040 pixels. The display also supports HDR. The headset uses fresnel lenses.', 549.99),
    Product('assets/accessory_7.png', 'accessory', 'Fitbit Charge 5', 'Charge 5 contains a vibration motor for alarms, goals, notifications, reminders, and apps. Battery. Charge 5 contains a rechargeable lithium-polymer battery.', 134.96),
    Product('assets/accessory_8.png', 'accessory', 'Yealink UH37', 'The Yealink UH37 is a high-quality headset that connects to your computer via a USB cable. It has a 35mm speaker and impressive stereo sound', 87.99),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              IntrinsicHeight(
                child: Container(
                  margin: const EdgeInsets.only(left: 16.0, right: 8.0),
                  width: 4,
                  color: mediumYellow,
                ),
              ),
              Center(
                  child: Text(
                'Recommended',
                style: TextStyle(
                    color: darkGrey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              )),
            ],
          ),
        ),
        Flexible(
          child: Container(
            padding: EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
            child: MasonryGridView.count(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              crossAxisCount: 4,
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) => new ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => ProductPage(product: products[index]))),
                  child: Container(
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                            colors: [
                              Colors.grey.withOpacity(0.3),
                              Colors.grey.withOpacity(0.7),
                            ],
                            center: Alignment(0, 0),
                            radius: 0.6,
                            focal: Alignment(0, 0),
                            focalRadius: 0.1),
                      ),
                      child: Hero(
                          tag: products[index].image,
                          child: Image.asset(products[index].image))),
                ),
              ),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            ),
          ),
        ),
      ],
    );
  }
}
