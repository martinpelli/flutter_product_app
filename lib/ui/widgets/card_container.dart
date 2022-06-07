import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Widget child;
  const CardContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(padding: const EdgeInsets.all(20), decoration: _buildBoxDecoration(), child: child),
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
        boxShadow: const <BoxShadow>[BoxShadow(color: Colors.black12, blurRadius: 15, offset: Offset(0, 5))]);
  }
}
