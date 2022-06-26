import 'package:flutter/material.dart';
import 'package:flutter_products_app/ui/widgets/product_image.dart';

import '../decorations/input_decoration.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
              const ProductImage(),
              Positioned(
                top: 60,
                left: 20,
                child: IconButton(
                  onPressed: (() => Navigator.of(context).pop()), 
                  icon: const Icon(Icons.arrow_back_ios_new, size: 40, color: Colors.white))),
              Positioned(
                top: 60,
                right: 20,
                child: IconButton(
                  onPressed: (){}, 
                  icon: const Icon(Icons.camera_alt_outlined, size: 40, color: Colors.white))),
              ]),
              const _productForm(),
              const SizedBox(height: 100)
          ],
        ),
      ),
    floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    floatingActionButton: FloatingActionButton(
      child: const Icon(Icons.save_outlined),
      onPressed: (){},
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: _buildBoxDecoration(),
        child: Form(child: Column(
          children: [
            const SizedBox(height: 10),
            TextField(decoration: CustomInputDecoration.customInputDecoration(labelText: 'Nombre:', hintText: 'Nombre del producto')),
            const SizedBox(height:30),
            TextField(
              keyboardType: TextInputType.number,
              decoration: CustomInputDecoration.customInputDecoration(labelText: 'Precio:', hintText: '\$150')),
            const SizedBox(height:30),
            SwitchListTile.adaptive(
              title: const Text('Disponible'),
              activeColor: Colors.indigo,
              value: true, 
              onChanged: (value){}
              ),
            const SizedBox(height:30),
          ],
        )),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          offset: const Offset(0,5),
          blurRadius: 5
        )
      ]
    );
  }
}
