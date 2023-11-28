import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prova_flutter/app/core/ui/extensions/theme_extensions.dart';
import 'package:prova_flutter/app/core/ui/widgets/text_button_politica_widget.dart';

import 'package:prova_flutter/app/views/home/widgets/home_text_field.dart';
import 'package:prova_flutter/app/views/home/widgets/tile_widget.dart';

import '../../controllers/home_controller.dart';

part 'widgets/home_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
              HomeWidget(
                controller: _controller,
              ),
              SizedBox(height: constraints.maxHeight * .16),
              TextButtonPoliticaWidget(),
            ],
          );
        }),
      ),
    );
  }

  

  Future<void> _loadTexts() async {
    await _controller.readAllKeys();
    await _controller.readAllTexts();
  }
}
