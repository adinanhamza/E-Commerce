import 'package:flutter/material.dart';
import 'package:onlineshop/viewmodel/provider.dart';
import 'package:provider/provider.dart';

class SearchBarWithResults extends StatelessWidget {
  final TextEditingController controller;

  const SearchBarWithResults({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ShoppingProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          onChanged: provider.searchProducts,
          decoration: InputDecoration(
            hintText: 'Search for products...',
            prefixIcon: Icon(Icons.search),
            suffixIcon: controller.text.isNotEmpty
                ? IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      controller.clear();
                      provider.searchProducts('');
                    },
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        if (provider.isSearching)
          SizedBox(
            height: 250,
            child: provider.searchedProducts.isEmpty
                ? Center(child: Text('No matching products found.'))
                : Consumer<ShoppingProvider>(
                  builder: (context, value, child) {
                             return          ListView.builder(
                      itemCount: provider.searchedProducts.length,
                      itemBuilder: (context, index) {
                        final product = provider.searchedProducts[index];
                        return ListTile(
                          leading: SizedBox(child: Image.network(product.networkImage, width: 50,fit: BoxFit.cover,)),
                          title: Text(product.name),
                          subtitle: Text('\$${product.currentPrice.toStringAsFixed(2)}'),
                        );
                      },
                    );
                  },

                ),
          ),
      ],
    );
  }
}
