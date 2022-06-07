import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: size.width,
          height: size.height * 0.4,
          decoration: _buildBoxDecoration(),
          child: Stack(children: const [
            _Bubble(left: 20, top: 200),
            _Bubble(left: 350, top: 100),
            _Bubble(left: 0, top: 120),
            _Bubble(left: -40, top: -20),
            _Bubble(left: 240, top: 15),
            HeaderIcon(),
          ]),
        ),
      ],
    );
  }

  BoxDecoration _buildBoxDecoration() =>
      const BoxDecoration(gradient: LinearGradient(colors: [Color.fromRGBO(63, 63, 156, 1), Color.fromRGBO(90, 70, 178, 1)]));
}

class HeaderIcon extends StatelessWidget {
  const HeaderIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        width: double.infinity,
        child: const Icon(
          Icons.person_pin,
          size: 100,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _Bubble extends StatelessWidget {
  final double left;
  final double top;

  const _Bubble({Key? key, required this.left, required this.top}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.white.withOpacity(0.1)),
      ),
    );
  }
}
