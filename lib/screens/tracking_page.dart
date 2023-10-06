import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'; // Import the Google Maps package
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
  GoogleMapController? mapController; // Add a controller for the Google Map

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
    final Set<String> uniqueProductNames = Set<String>();
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
        children: <Widget>[
          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(-6.165725, 106.791763), // Tarumanagara University coordinates
                zoom: 15.0, // You can adjust the initial zoom level
              ),
              markers: {
                Marker(
                  markerId: MarkerId('tarumanagara_university'),
                  position: LatLng(-6.165725, 106.791763), // Tarumanagara University coordinates
                  infoWindow: InfoWindow(title: 'Tarumanagara University'),
                  icon: BitmapDescriptor.defaultMarker, // You can customize the icon if needed
                ),
              },
              onMapCreated: (GoogleMapController controller) {
                setState(() {
                  mapController = controller;
                });
              },
            ),
          ),
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
                  items: uniqueProducts.map((product) =>
                      DropdownMenuItem<String>(
                        value: product.name,
                        child: Text(
                          product.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      )).toList(),
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
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
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
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                primary: Colors.orange,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9.0),
                ),
              ),
              child: Text(
                'Back to Main Page',
                style: TextStyle(
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
