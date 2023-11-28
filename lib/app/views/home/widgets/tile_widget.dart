import 'package:flutter/material.dart';
import 'package:prova_flutter/app/controllers/home_controller.dart';

import '../../../models/text_model.dart';
import 'alert_dialog/alert_edit_dialog_widget.dart';
import 'alert_dialog/alert_remove_dialog_widget.dart';


class TileWidget extends StatefulWidget {
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final HomeController homeController;
  final TextModel textModel;

  const TileWidget({
    super.key,
    required this.textEditingController,
    required this.focusNode,
    required this.homeController,
    required this.textModel,
  });

  @override
  State<TileWidget> createState() => _TileWidgetState();
}

class _TileWidgetState extends State<TileWidget> {
  @override
  Widget build(BuildContext context) {
    final focusNodeEdit = widget.focusNode;
    final textEditingController = widget.textEditingController;
    final controller = widget.homeController;
    final textModel = widget.textModel;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: SizedBox(
        height: 60,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 6,
                  child: SizedBox(
                    child: Center(
                      child: Text(
                        textModel.text,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertEditDialogWidget(
                              textEditingController: textEditingController,
                              focusNode: focusNodeEdit,
                              homeController: controller,
                              textModel: widget.textModel);
                        },
                      );
                    },
                    icon: const Icon(Icons.edit_outlined),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    onPressed: () async {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertRemoveDialogWidget(
                              homeController: controller,
                              textModel: widget.textModel);
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.remove_circle_outline,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
            const Expanded(flex: 1, child: Divider())
          ],
        ),
      ),
    );
  }
}
