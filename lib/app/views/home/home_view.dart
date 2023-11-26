import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prova_flutter/app/core/ui/extensions/theme_extensions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controllers/home_controller.dart';
import '../../models/text_model.dart';

part 'widgets/home_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final Uri _url = Uri.parse('http://www.google.com.br');
  late HomeController _controller;

  @override
  void initState() {
    super.initState();
    _controller = HomeController();
    _loadTexts();
    
  }

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
            children: [
              SizedBox(height: constraints.maxHeight * .1),
              HomeWidget(controller: _controller,),
              SizedBox(height: constraints.maxHeight * .1),
              TextButton(
                onPressed: _launchUrl,
                child: const Text(
                  "Política de Privacidade",
                  style: TextStyle(color: Colors.white, fontSize: 16),
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

  Future<void> _loadTexts() async {
    await _controller.readAllKeys();
    await _controller.readAllTexts();
  }
}
