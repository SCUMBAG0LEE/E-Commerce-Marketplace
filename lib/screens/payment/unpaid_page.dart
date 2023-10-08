import 'package:bad_tech/app_properties.dart';
import 'package:flutter/material.dart';
import 'package:bad_tech/models/product.dart';
import 'package:bad_tech/screens/tracking_page.dart';

class UnpaidPage extends StatefulWidget {
  final List<Product> selectedProducts; // List of selected products
  UnpaidPage({required this.selectedProducts});
  @override
  _UnpaidPageState createState() => _UnpaidPageState();
}

class _UnpaidPageState extends State<UnpaidPage> {
  @override
  Widget build(BuildContext context) {
    final selectedProducts = widget.selectedProducts;
    Widget payNow = InkWell(
      // Add your payment logic here
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => TrackingPage(selectedProducts: selectedProducts),
        ),
      ),
    
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
            )
          ],
          borderRadius: BorderRadius.circular(9.0),
        ),
        child: Center(
          child: Text(
            "Pay Now",
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

    return Material(
      color: Colors.white,
      child: SafeArea(
        child: LayoutBuilder(
          builder: (_, constraints) => SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: kToolbarHeight),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Unpaid',
                            style: TextStyle(
                              color: darkGrey,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          CloseButton()
                        ],
                      ),
                    ),
                    // Display selected products
                    Column(
                      children: selectedProducts.map((product) {
                        return CustomProductTile(
                          product: product,
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: payNow,
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

class CustomProductTile extends StatelessWidget {
  final Product product;

  CustomProductTile({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80, // Set the desired width for the image
            height: 80, // Set the desired height for the image
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(product.image), // Product image
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name, // Product name
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '\$${product.price.toStringAsFixed(2)}', // Product price
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
