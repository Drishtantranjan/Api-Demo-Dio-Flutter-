import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Ecomm extends StatefulWidget {
  const Ecomm({Key? key}) : super(key: key);

  @override
  State<Ecomm> createState() => _EcommState();
}

class _EcommState extends State<Ecomm> {
  List<dynamic> products = [];

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  Future<void> getProducts() async {
    try {
      var response = await Dio().get("https://fakestoreapi.com/products");
      setState(() {
        products = response.data;
      });
    } catch (error) {
      print("Products not found $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Ecommerce"),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
        ),
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          final product = products[index];

          return GridTile(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  // Background color
                ),
                child: Image.network(
                  product['image'],
                  fit: BoxFit.contain, // Ensure the image fills the container
                ),
              ),
            ),
            footer: Container(
              color: Colors.white, // Footer background color
              child: ListTile(
                title: Text(product['title']),
                subtitle: Text("\$${product['price']}"),
              ),
            ),
          );
        },
      ),
    );
  }
}
