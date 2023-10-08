import 'package:bad_tech/app_properties.dart';
import 'package:bad_tech/models/product.dart';
import 'package:bad_tech/screens/shop/check_out_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bad_tech/models/cart_provider.dart';

import 'shop_product.dart';

class ShopBottomSheet extends StatefulWidget {
  final List<Product> selectedProducts;
  final Function(Product) onProductRemoved;

  ShopBottomSheet({required this.selectedProducts, required this.onProductRemoved});

  @override
  _ShopBottomSheetState createState() => _ShopBottomSheetState();
}

class _ShopBottomSheetState extends State<ShopBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    Widget confirmButton = InkWell(
      onTap: () async {
        Navigator.of(context).pop();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => CheckOutPage(),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        padding: EdgeInsets.symmetric(vertical: 20.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom == 0 ? 20 : MediaQuery.of(context).padding.bottom,
        ),
        child: Center(
          child: new Text(
            "Confirm",
            style: const TextStyle(
              color: const Color(0xfffefefe),
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
              fontSize: 20.0,
            ),
          ),
        ),
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
      ),
    );

    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.9),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24),
          topLeft: Radius.circular(24),
        ),
      ),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Image.asset(
                'assets/box.png',
                height: 24,
                width: 24.0,
                fit: BoxFit.cover,
              ),
              onPressed: () {},
              iconSize: 48,
            ),
          ),
          SizedBox(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.selectedProducts.length,
              itemBuilder: (_, index) {
                return Row(
                  children: <Widget>[
                    ShopProduct(
                      widget.selectedProducts[index],
                      onRemove: () {
                        // Call the callback to remove the product
                        widget.onProductRemoved(widget.selectedProducts[index]);
                        setState(() {
                          
                        });
                      },
                    ),
                  ],
                );
              },
            ),
          ),
          confirmButton,
        ],
      ),
    );
  }
}

