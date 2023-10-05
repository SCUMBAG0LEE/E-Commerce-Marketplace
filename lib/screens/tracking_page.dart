import 'package:flutter/material.dart';
import 'package:bad_tech/models/product.dart';
import 'package:bad_tech/screens/main/main_page.dart';

class TrackingPage extends StatefulWidget {
  final List<Product> selectedProducts; // List of selected products
  TrackingPage({required this.selectedProducts});

  @override
  _TrackingPageState createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage> {
  String selectedProduct = '';

  @override
  void initState() {
    super.initState();
    // Initialize selectedProduct with the first product from the list
    selectedProduct = widget.selectedProducts.isNotEmpty
        ? widget.selectedProducts.first.name
        : '';
  }

  @override
  Widget build(BuildContext context) {
    // Create a Set to store unique product names
    final Set<String> uniqueProductNames = Set<String>();

    // Filter out duplicates based on product name
    final List<Product> uniqueProducts = widget.selectedProducts.where((product) {
      final isUnique = uniqueProductNames.add(product.name);
      return isUnique;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.grey),
        title: Text(
          'Shipped',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  items: uniqueProducts
                      .map((product) => DropdownMenuItem<String>(
                            value: product.name, // Use a unique identifier as the value
                            child: Text(
                              product.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ))
                      .toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedProduct = newValue!;
                    });
                  },
                  value: selectedProduct,
                  isExpanded: true,
                  icon: Icon(Icons.keyboard_arrow_down),
                  elevation: 0,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey[100],
              padding: EdgeInsets.all(16.0),
              child: Image.asset(
                'assets/map.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width / 2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.orange, Colors.deepOrange],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.16),
                  offset: Offset(0, 5),
                  blurRadius: 10.0,
                ),
              ],
              borderRadius: BorderRadius.circular(9.0),
            ),
            child: ElevatedButton(
              onPressed: () {
                // Navigate to MainPage using a MaterialPageRoute
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainPage(),
                  ),
                );
              },
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0), // Remove button elevation
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9.0),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent), // Make button transparent
              ),
              child: Text(
                'Go to Main Page',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
