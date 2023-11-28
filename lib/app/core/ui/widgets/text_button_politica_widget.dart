import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TextButtonPoliticaWidget extends StatelessWidget {
  TextButtonPoliticaWidget({super.key});

  final Uri _url = Uri.parse('http://www.google.com.br');

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _launchUrl,
      child: const Text(
        "Política de Privacidade",
        style: TextStyle(color: Colors.white, fontSize: 16),
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
