import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        Column(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.35,
              color: Colors.purple,
            ),
            Container(
              color: Colors.white,
              width: size.width,
              height: size.height * 0.65,
            )
          ],
        ),
        Center(
            child: SingleChildScrollView(
          controller: _controller,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                width: size.width * 0.85,
                height: size.height * 0.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: <BoxShadow>[BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 15)]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Ingreso",
                      style: TextStyle(color: Colors.black54, fontSize: 30),
                    ),
                    const SizedBox(height: 30),
                    const TextField(
                      decoration: InputDecoration(hintText: 'Correo electrónico', prefixIcon: Icon(Icons.alternate_email)),
                    ),
                    const SizedBox(height: 20),
                    const TextField(
                      decoration: InputDecoration(hintText: 'Contraseña', prefixIcon: Icon(Icons.lock)),
                    ),
                    const SizedBox(height: 40),
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                          backgroundColor: MaterialStateProperty.all(Colors.purple),
                          fixedSize: MaterialStateProperty.all(Size(size.width * 0.85 * 0.6, 40))),
                      child: const Text(
                        'Ingresar',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ))
      ],
    ));
  }
}
