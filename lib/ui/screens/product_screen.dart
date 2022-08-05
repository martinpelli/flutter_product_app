import 'package:flutter/material.dart';
import 'package:flutter_products_app/providers/product_form_provider.dart';
import 'package:flutter_products_app/services/services.dart';
import 'package:flutter_products_app/ui/widgets/product_image.dart';
import 'package:provider/provider.dart';

import '../decorations/input_decoration.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);

    return ChangeNotifierProvider(
      create: (_) => ProductFormProvider(productService.selectedProduct),
      child: _ProductScreenBody(productService: productService),
    );
  }
}

class _ProductScreenBody extends StatelessWidget {
  const _ProductScreenBody({
    Key? key,
    required this.productService,
  }) : super(key: key);

  final ProductService productService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              ProductImage(url: productService.selectedProduct.picture),
              Positioned(
                  top: 60,
                  left: 20,
                  child: IconButton(
                      onPressed: (() => Navigator.of(context).pop()), icon: const Icon(Icons.arrow_back_ios_new, size: 40, color: Colors.white))),
              Positioned(
                  top: 60,
                  right: 20,
                  child: IconButton(onPressed: () {}, icon: const Icon(Icons.camera_alt_outlined, size: 40, color: Colors.white))),
            ]),
            const _productForm(),
            const SizedBox(height: 100)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save_outlined),
        onPressed: () {},
      ),
    );
  }
}

class _productForm extends StatelessWidget {
  const _productForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context).product;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: _buildBoxDecoration(),
        child: Form(
            child: Column(
          children: [
            const SizedBox(height: 10),
            TextFormField(
              decoration: CustomInputDecoration.customInputDecoration(labelText: 'Name:', hintText: 'Product name'),
              initialValue: productForm.name,
              onChanged: (value) => productForm.name = value,
              validator: ((value) {
                if (value == null || value.isEmpty) return 'Name obligatory';
              }),
            ),
            const SizedBox(height: 30),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: CustomInputDecoration.customInputDecoration(labelText: 'Price:', hintText: '\$150'),
              onChanged: (value) {
                if (double.tryParse(value) == null) {
                  productForm.price = 0;
                } else {
                  productForm.price = double.parse(value);
                }
              },
              validator: ((value) {
                if (value == null || value.isEmpty) return 'Price obligatory';
              }),
              initialValue: productForm.price.toString(),
            ),
            const SizedBox(height: 30),
            SwitchListTile.adaptive(title: const Text('Available'), activeColor: Colors.indigo, value: productForm.available, onChanged: (value) {}),
            const SizedBox(height: 30),
          ],
        )),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), offset: const Offset(0, 5), blurRadius: 5)]);
  }
}
