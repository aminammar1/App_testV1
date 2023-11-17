// Display product //

import 'package:flutter/material.dart';
import "package:app_test/woocommerce_service.dart";

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<dynamic> products = [];

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    try {
      String accessToken = await WooCommerceService.getAccessToken();

      List<dynamic> fetchedProducts =
          await WooCommerceService.fetchProducts(accessToken);
      setState(() {
        products = fetchedProducts;
      });
    } catch (e) {
      // Handle errors, e.g., show an error message
      print('Error display products: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index]['name']),
            subtitle: Text('Price: \$${products[index]['price']}'),
            // Display more product details as needed
          );
        },
      ),
    );
  }
}
