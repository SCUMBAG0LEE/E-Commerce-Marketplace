import 'package:card_swiper/card_swiper.dart';
import 'package:bad_tech/app_properties.dart';
import 'package:bad_tech/models/product.dart';
import 'package:bad_tech/screens/address/add_address_page.dart';
import 'package:bad_tech/screens/payment/unpaid_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import Provider package
import 'package:bad_tech/models/cart_provider.dart'; // Import CartProvider
import 'components/credit_card.dart';
import 'components/shop_item_list.dart';

class CheckOutPage extends StatefulWidget {
  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  SwiperController swiperController = SwiperController();

  @override
  Widget build(BuildContext context) {
    // Access the CartProvider
    final cartProvider = Provider.of<CartProvider>(context);

    Widget checkOutButton = InkWell(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => AddAddressPage())),
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
          child: Text("Check Out",
              style: const TextStyle(
                color: const Color(0xfffefefe),
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
                fontSize: 20.0,
              )),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: darkGrey),
        actions: <Widget>[
          IconButton(
            icon: Image.asset('assets/icons/denied_wallet.png'),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => UnpaidPage(selectedProducts: cartProvider.selectedProducts)

              ),
            ),
          ),
        ],
        title: Text(
          'Checkout',
          style: TextStyle(
            color: darkGrey,
            fontWeight: FontWeight.w500,
            fontSize: 18.0,
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (_, constraints) => SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  height: 48.0,
                  color: yellow,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Subtotal',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        cartProvider.selectedProducts.length.toString() +
                            ' items',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: Scrollbar(
                    child: ListView.builder(
                      itemBuilder: (_, index) => ShopItemList(
                        cartProvider.selectedProducts[index],
                        onRemove: () {
                          // Remove the product from the cart when the remove button is pressed
                          cartProvider.removeFromCart(
                              cartProvider.selectedProducts[index]);
                        },
                      ),
                      itemCount: cartProvider.selectedProducts.length,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Payment',
                    style: TextStyle(
                      fontSize: 20,
                      color: darkGrey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 250,
                  child: Swiper(
                    itemCount: 2,
                    itemBuilder: (_, index) {
                      return CreditCard();
                    },
                    scale: 0.8,
                    controller: swiperController,
                    viewportFraction: 0.6,
                    loop: false,
                    fade: 0.7,
                  ),
                ),
                SizedBox(height: 24),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).padding.bottom == 0
                          ? 20
                          : MediaQuery.of(context).padding.bottom,
                    ),
                    child: checkOutButton,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
