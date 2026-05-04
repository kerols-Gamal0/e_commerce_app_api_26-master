import 'package:ecommerce_app_api_26/features/home/data/models/product_model.dart';
import 'package:ecommerce_app_api_26/features/home/data/products_api/product_api.dart';
import 'package:ecommerce_app_api_26/features/home/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';

class CategoryProduct extends StatelessWidget {
  const CategoryProduct({super.key, required this.categoryId});

  final int categoryId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: ProductApi().getProductsByCategory(categoryId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          List<ProductModel> products = snapshot.data!;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductCard(
                    title: product.title!,
                    price: product.price!.toDouble(),
                    description: product.description!,
                    image: product.images![0],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
