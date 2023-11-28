import 'package:flutter/material.dart';

import '../../../controllers/home_controller.dart';
import '../../../models/text_model.dart';

class HomeTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final HomeController homeController;

  const HomeTextField({
    super.key,
    required this.textEditingController,
    required this.focusNode,
    required this.homeController,
  });

  @override
  State<HomeTextField> createState() => _HomeTextFieldState();
}

class _HomeTextFieldState extends State<HomeTextField> {
  @override
  Widget build(BuildContext context) {
    final focusNode = widget.focusNode;
    final textEditingController = widget.textEditingController;
    final controller = widget.homeController;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
      child: TextField(
        autofocus: true,
        focusNode: focusNode,
        controller: textEditingController,
        decoration: InputDecoration(
          label: focusNode.hasFocus
              ? null
              : const Center(child: Text('Digite seu texto')),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          alignLabelWithHint: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          // label: const Center(child: Text('Digite seu texto')),
          labelStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        textAlign: TextAlign.center,
        onSubmitted: (value) async {
          if (value.isNotEmpty) {
            final textModel =
                TextModel(key: DateTime.now().toIso8601String(), text: value);
            await controller.write(textModel);
            await controller.readAllTexts();
            textEditingController.clear();
          }
          await Future.delayed(const Duration(milliseconds: 200));
          focusNode.requestFocus();
        },
      ),
    );
  }
}
