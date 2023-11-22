import 'package:flutter/material.dart';
import 'package:prova_flutter/app/core/ui/extensions/theme_extensions.dart';
import 'package:prova_flutter/app/views/info/widgets/card_info.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoView extends StatefulWidget {
  const InfoView({super.key});

  @override
  State<InfoView> createState() => _InfoViewState();
}

class _InfoViewState extends State<InfoView> {
  final Uri _url = Uri.parse('http://www.google.com.br');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              context.primaryColor,
              context.primaryColorLigth,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: LayoutBuilder(builder: (context, constraints) {
          return ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: constraints.maxHeight / 4),
              const CardInfo(),
              SizedBox(height: constraints.maxHeight / 3.8),
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
