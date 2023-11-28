import 'package:flutter/material.dart';
import 'package:prova_flutter/app/core/ui/extensions/theme_extensions.dart';
import 'package:prova_flutter/app/core/ui/widgets/text_button_politica_widget.dart';
import 'package:prova_flutter/app/views/home/home_view.dart';

import '../../controllers/login_controller.dart';
import '../../core/ui/widgets/elevated_button_custom.dart';
import '../../core/ui/widgets/text_form_field_custom.dart';
import 'package:validatorless/validatorless.dart';

part 'widgets/login_form.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [context.primaryColor, context.primaryColorLigth],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: LayoutBuilder(builder: (context, constraints) {
          return ListView(
            children: [
              SizedBox(height: constraints.maxHeight * .3),
              const _LoginForm(),
              SizedBox(height: constraints.maxHeight * .2),
              TextButtonPoliticaWidget(),
            ],
          );
        }),
      ),
    );
  }

  
}
