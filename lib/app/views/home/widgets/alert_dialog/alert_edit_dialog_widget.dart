import 'package:flutter/material.dart';
import 'package:prova_flutter/app/controllers/home_controller.dart';

import '../../../../models/text_model.dart';

class AlertEditDialogWidget extends StatefulWidget {
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final HomeController homeController;
  final TextModel textModel;

  const AlertEditDialogWidget({
    super.key,
    required this.textEditingController,
    required this.focusNode,
    required this.homeController,
    required this.textModel,
  });

  @override
  State<AlertEditDialogWidget> createState() => _AlertEditDialogWidgetState();
}

class _AlertEditDialogWidgetState extends State<AlertEditDialogWidget> {
  @override
  Widget build(BuildContext context) {
    final focusNodeEdit = widget.focusNode;
    final textEditingController = widget.textEditingController;
    final controller = widget.homeController;
    final textModel = widget.textModel;

    return SizedBox(
      height: 200,
      width: 250,
      child: AlertDialog(
        title: const Text(
          "Editar",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: TextField(
          focusNode: focusNodeEdit,
          controller: textEditingController,
          decoration: InputDecoration(
            label: focusNodeEdit.hasFocus
                ? null
                : Center(child: Text(textModel.text)),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            alignLabelWithHint: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 10),
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
        ),
        actions: [
          TextButton(
            child: const Text(
              "Cancelar",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () async {
              textEditingController.clear();
              setState(() {
                Navigator.of(context).pop();
              });
            },
          ),
          TextButton(
            child: const Text(
              "Editar",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () async {
              if (textEditingController.text.isNotEmpty) {
                final textModelEditado = TextModel(
                    key: textModel.key, text: textEditingController.text);
                await controller.edit(textModel, textModelEditado);
                await controller.readAllTexts();
                textEditingController.clear();
                setState(() {
                  Navigator.of(context).pop();
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
