import 'package:flutter/material.dart';

import '../../models/models.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      width: double.infinity,
      height: 400,
      decoration: _buildBoxDecoration(),
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          _BackgroundImage(url: product.picture),
          _productDetails(name: product.name, id: product.id!),
          Positioned(top: 0, right: 0, child: _priceTag(price: product.price)),
          if (!product.available) Positioned(top: 0, left: 0, child: _NotAvailableTag())
        ],
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: const <BoxShadow>[BoxShadow(color: Colors.black12, offset: Offset(0, 7), blurRadius: 10)]);
  }
}

class _NotAvailableTag extends StatelessWidget {
  const _NotAvailableTag({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 70,
      decoration: BoxDecoration(
          color: Colors.yellow[800], borderRadius: const BorderRadius.only(topLeft: Radius.circular(25), bottomRight: Radius.circular(25))),
      child: const FittedBox(
          fit: BoxFit.contain,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text('Not Available', style: TextStyle(color: Colors.white, fontSize: 20)),
          )),
    );
  }
}

class _priceTag extends StatelessWidget {
  const _priceTag({
    Key? key,
    required this.price,
  }) : super(key: key);

  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 100,
      height: 70,
      decoration:
          const BoxDecoration(color: Colors.indigo, borderRadius: BorderRadius.only(topRight: Radius.circular(25), bottomLeft: Radius.circular(25))),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10), child: Text('\$$price', style: const TextStyle(color: Colors.white, fontSize: 20))),
      ),
    );
  }
}

class _productDetails extends StatelessWidget {
  const _productDetails({
    Key? key,
    required this.name,
    required this.id,
  }) : super(key: key);

  final String name;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: 70,
        decoration: _buildBoxDecoration(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(name,
              style: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis),
          Text(id, style: const TextStyle(fontSize: 15, color: Colors.white))
        ]),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => const BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), topRight: Radius.circular(25)),
        color: Colors.indigo,
      );
}

class _BackgroundImage extends StatelessWidget {
  const _BackgroundImage({
    Key? key,
    this.url,
  }) : super(key: key);

  final String? url;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
          width: double.infinity,
          height: 400,
          child: url != null
              ? FadeInImage(
                  placeholder: const AssetImage('assets/jar-loading.gif'),
                  image: NetworkImage(url!),
                  fit: BoxFit.cover,
                )
              : Image(image: AssetImage('assets/no-image.png'), fit: BoxFit.cover)),
    );
  }
}
