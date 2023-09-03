import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final String productName;

  ProductDetailPage({required this.productName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết sản phẩm'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Trang chi tiết sản phẩm',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              'Sản phẩm: $productName',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
