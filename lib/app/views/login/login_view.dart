import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prova_flutter/app/core/ui/extensions/theme_extensions.dart';
import 'package:prova_flutter/app/views/home/home_view.dart';
import 'package:url_launcher/url_launcher.dart';

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
  final Uri _url = Uri.parse('http://www.google.com.br');

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
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextButton(
                  onPressed: _launchUrl,
                  child: const Text(
                    "Política de Privacidade",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (await canLaunchUrl(
      _url,
    )) {
      await launchUrl(_url, mode: LaunchMode.externalApplication);
    }
  }
}
