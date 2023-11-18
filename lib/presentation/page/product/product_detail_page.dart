import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/presentation/page/cart/cart_provider.dart';

class ProductDetailPage extends StatefulWidget {
  final Map<String, Object> product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int selectedSize = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Detail'),
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back_ios),
        //   onPressed: () {
        //     Navigator.of(context).pop();
        //   },
        // ),
      ),
      body: _productDetailBody(),
    );
  }

  Widget _productDetailBody() {
    return Column(
      children: [
        const SizedBox(height: 20),
        Center(
          child: Text(
            widget.product['title'] as String,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const Spacer(),
        Image.asset(widget.product['imageUrl'] as String),
        const Spacer(flex: 2),
        _bottomLayout(),
      ],
    );
  }

  Widget _bottomLayout() {
    return Container(
      height: 250,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(245, 247, 249, 1),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              '\$${widget.product['price']}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _productSize().length,
              itemBuilder: (context, index) {
                final size = _productSize()[index];

                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 3),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedSize = size;
                      });
                    },
                    child: Chip(
                      label: Text(size.toString()),
                      backgroundColor: selectedSize == size
                          ? Theme.of(context).colorScheme.primary
                          : null,
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton.icon(
                icon: const Icon(Icons.shopping_cart),
                onPressed: addToCartListener,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.redAccent,
                  shape: const StadiumBorder(),
                  minimumSize: const Size(double.infinity, 50),
                ),
                label: Text(
                  'Add to cart',
                  style: Theme.of(context).textTheme.bodySmall,
                )),
          )
        ],
      ),
    );
  }

  void addToCartListener() {
    if (selectedSize == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a size!'),
        ),
      );
      return;
    }
    Provider.of<CartProvider>(context, listen: false).addProduct(
      {
        'id': widget.product['id'],
        'title': widget.product['title'],
        'price': widget.product['price'],
        'imageUrl': widget.product['imageUrl'],
        'company': widget.product['company'],
        'size': selectedSize,
      },
    );
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Product added successfully!'),
        ),
      );
  }

  List<int> _productSize() {
    return widget.product['sizes'] as List<int>;
  }
}
