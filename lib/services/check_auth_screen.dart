import 'package:flutter/material.dart';
import 'package:flutter_products_app/services/services.dart';
import 'package:flutter_products_app/ui/screens/home_screen.dart';
import 'package:flutter_products_app/ui/screens/screens.dart';
import 'package:provider/provider.dart';

class CheckAuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: authService.readToken(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) return const Text('');

            if (snapshot.data == '') {
              Future.microtask(() {
                Navigator.pushReplacement(
                    context, PageRouteBuilder(pageBuilder: ((_, __, ___) => LoginScreen()), transitionDuration: const Duration(seconds: 0)));

                //Navigator.of(context).pushReplacementNamed('home');
              });
            } else {
              Future.microtask(() {
                Navigator.pushReplacement(
                    context, PageRouteBuilder(pageBuilder: ((_, __, ___) => HomeScreen()), transitionDuration: const Duration(seconds: 0)));

                //Navigator.of(context).pushReplacementNamed('home');
              });
            }

            return Text('Espere');
          },
        ),
      ),
    );
  }
}
