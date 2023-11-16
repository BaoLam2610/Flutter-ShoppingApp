import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
      ),
      body: _productDetailBody(context),
    );
  }

  Widget _productDetailBody(BuildContext context) {
    return Column(
      children: [
        Text('This is a Detail', style: Theme.of(context).textTheme.titleLarge,)
      ],
    );
  }
}
