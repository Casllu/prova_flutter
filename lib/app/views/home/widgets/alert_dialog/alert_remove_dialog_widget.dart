import 'package:flutter/material.dart';
import 'package:prova_flutter/app/controllers/home_controller.dart';
import 'package:prova_flutter/app/models/text_model.dart';

class AlertRemoveDialogWidget extends StatefulWidget {
  final HomeController homeController;
  final TextModel textModel;

  const AlertRemoveDialogWidget({ super.key , required this.homeController, required this.textModel});

  @override
  State<AlertRemoveDialogWidget> createState() => _AlertRemoveDialogWidgetState();
}

class _AlertRemoveDialogWidgetState extends State<AlertRemoveDialogWidget> {
   @override
   Widget build(BuildContext context) {
    final controller = widget.homeController;
    final textModel = widget.textModel;

       return AlertDialog(
      title: const Text(
        "Remover",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: const Text(
        "Deseja remover esse texto ?",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      actions: [
        TextButton(
          child: const Text("Cancelar"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text("Remover"),
          onPressed: () async {
            await controller.remove(textModel);
            setState(() {
              Navigator.of(context).pop();
            });
          },
        ),
      ],
    );
  }
}