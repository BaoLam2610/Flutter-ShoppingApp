import 'package:flutter/material.dart';
import 'package:shopping_app/common/constants.dart';
import 'package:shopping_app/presentation/page/home/product_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> filters = const ['All', 'Addidas', 'Nike', 'Bata'];
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _homeBody()),
    );
  }

  Widget _homeBody() {
    return Column(
      children: [
        _searchBarSection(),
        _chipSection(),
        _productSection(),
      ],
    );
  }

  Widget _searchBarSection() {
    const border = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black26),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(20),
      ),
    );
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Shopping\nCollections',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: Icon(Icons.search),
              enabledBorder: border,
              focusedBorder: border,
            ),
          ),
        )
      ],
    );
  }

  Widget _chipSection() {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        itemBuilder: (context, index) {
          final filter = filters[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedFilter = filter;
                });
              },
              child: Chip(
                backgroundColor: selectedFilter == filter
                    ? Theme.of(context).colorScheme.primary
                    : const Color.fromRGBO(245, 247, 249, 1),
                side: BorderSide(
                    color: selectedFilter == filter
                        ? Colors.redAccent
                        : const Color.fromRGBO(245, 247, 249, 1)),
                label: Text(filter),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _productSection() {
    return Expanded(
      child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];

          return ProductItem(
            productName: product['title'] as String,
            productPrice: product['price'] as double,
            productImage: product['imageUrl'] as String,
            color: index.isEven
                ? const Color.fromRGBO(216, 240, 253, 1)
                : const Color.fromRGBO(245, 247, 249, 1),
          );
        },
      ),
    );
  }
}
