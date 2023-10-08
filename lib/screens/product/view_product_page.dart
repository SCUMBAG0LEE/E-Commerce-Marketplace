import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:bad_tech/models/cart_provider.dart';
import '../../app_properties.dart';
import 'components/color_list.dart';
import 'components/more_products.dart';
import 'components/product_options.dart';
import 'package:bad_tech/models/product.dart';
import 'package:bad_tech/screens/search_page.dart';
import 'components/rating_bottomSheet.dart';

class ViewProductPage extends StatefulWidget {
  final Product product;

  ViewProductPage({required this.product});

  @override
  _ViewProductPageState createState() => _ViewProductPageState();
}

class _ViewProductPageState extends State<ViewProductPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int active = 0;

  @override
  Widget build(BuildContext context) {
    // Retrieve the CartProvider instance
    final CartProvider cartProvider = Provider.of<CartProvider>(context);

    Widget description = Padding(
      padding: const EdgeInsets.all(24.0),
      child: Text(
        widget.product.description,
        maxLines: 5,
        semanticsLabel: '...',
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.6)),
      ),
    );

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: yellow,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: darkGrey),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/search_icon.svg',
              fit: BoxFit.scaleDown,
            ),
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => SearchPage())),
          )
        ],
        title: Text(
          '${widget.product.category[0].toUpperCase()}${widget.product.category.substring(1)}',
          style: const TextStyle(
            color: darkGrey,
            fontWeight: FontWeight.w500,
            fontFamily: "Montserrat",
            fontSize: 18.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              ProductOption(
                _scaffoldKey,
                product: widget.product,
                onAddToCart: addToCart,
                selectedProducts: cartProvider.selectedProducts,
              ),
              description,
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Flexible(
                      child: ColorList([
                        Colors.red,
                        Colors.blue,
                        Colors.purple,
                        Colors.green,
                        Colors.yellow
                      ]),
                    ),
                    RawMaterialButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return RatingBottomSheet();
                          },
                        );
                      },
                      constraints: const BoxConstraints(
                        minWidth: 45,
                        minHeight: 45,
                      ),
                      child: Icon(
                        Icons.favorite,
                        color: Color.fromRGBO(255, 137, 147, 1),
                      ),
                      elevation: 0.0,
                      shape: CircleBorder(),
                      fillColor: Color.fromRGBO(255, 255, 255, 0.4),
                    ),
                  ],
                ),
              ),
              MoreProducts(),
            ],
          ),
        ),
      ),
    );
  }

  void addToCart(Product product) {
    final CartProvider cartProvider = Provider.of<CartProvider>(context, listen: false);
    cartProvider.addToCart(product);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Added to Cart: ${product.name}'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
