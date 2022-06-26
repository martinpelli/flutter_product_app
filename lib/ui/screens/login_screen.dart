import 'package:flutter/material.dart';
import 'package:flutter_products_app/providers/login_form_provider.dart';
import 'package:flutter_products_app/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      AuthBackground(),
      Center(
          child: SingleChildScrollView(
              child: Column(children: [
        const SizedBox(height: 50),
        CardContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Ingreso",
                style: TextStyle(color: Colors.black54, fontSize: 30),
              ),
              ChangeNotifierProvider(
                create: (_) => LoginFormProvider(),
                child: const FormInput(),
              )
            ],
          ),
        ),
        const SizedBox(height: 50),
        const Text(
          'Crear una nueva cuenta',
          style: TextStyle(color: Colors.black, fontSize: 18),
        )
      ])))
    ]));
  }
}

class FormInput extends StatelessWidget {
  const FormInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final LoginFormProvider loginFormProvider = Provider.of<LoginFormProvider>(context);

    return Form(
      key: loginFormProvider.keyForm,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          const SizedBox(height: 30),
          CustomFormField(
            onChange: (value) => loginFormProvider.email = value,
            labelText: 'Correo electrónico',
            icon: Icons.alternate_email,
            validate: (value) {
              String pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp = RegExp(pattern);
              return regExp.hasMatch(value ?? '') ? null : 'El correo no es válido';
            },
          ),
          const SizedBox(height: 20),
          CustomFormField(
            onChange: (value) => loginFormProvider.password = value,
            labelText: 'Contraseña',
            icon: Icons.lock,
            isSecret: true,
            validate: (value) {
              if (value != null && value.length >= 6) return null;
              return 'Contraseña demasiado corta';
            },
          ),
          const SizedBox(height: 40),
          TextButton(
            onPressed: loginFormProvider.isLoading
                ? null
                : () async {
                    FocusScope.of(context).unfocus();
                    if (!loginFormProvider.isValidForm()) return;
                    Navigator.pushReplacementNamed(context, 'home');
                  },
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                fixedSize: MaterialStateProperty.all(Size(size.width * 0.85 * 0.6, 40))),
            child: const Text(
              'Ingresar',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
