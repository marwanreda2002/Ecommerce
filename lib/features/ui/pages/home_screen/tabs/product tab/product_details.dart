import 'package:flutter/material.dart';

import '../../../../../../domain/entites/ProductResponseEntity.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)!.settings.arguments as ProductDataEntity;
    return Scaffold(
      body: Center(
        child: Text(arg.price.toString()),
      ),
    );
  }
}
