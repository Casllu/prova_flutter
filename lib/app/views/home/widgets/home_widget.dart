part of '../home_view.dart';

class HomeWidget extends StatefulWidget {
  final HomeController controller;

  const HomeWidget({super.key, required this.controller});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final _focusNode = FocusNode();
  final _focusNodeEdit = FocusNode();
  final _textController = TextEditingController();
  final _textControllerEdit = TextEditingController();

  @override
  void dispose() {
    _focusNode.dispose();
    _textController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = widget.controller;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Card(
            elevation: 8,
            child: SizedBox(
              height: 400,
              child: Observer(builder: (contex) {
                return ListView.builder(
                  itemCount: controller.listTexts.length,
                  itemBuilder: (context, index) {
                    final textModel = controller.listTexts[index];

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
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
                                      Widget alertDialog = showEditDialog(
                                          context, controller, textModel);

                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return alertDialog;
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
                                      AlertDialog alertDialog =
                                          showRemoveDialog(
                                              context, controller, textModel);

                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return alertDialog;
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
                  },
                );
              }),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
          child: TextField(
            autofocus: true,
            focusNode: _focusNode,
            controller: _textController,
            decoration: InputDecoration(
              label: _focusNode.hasFocus
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
                final textModel = TextModel(
                    key: DateTime.now().toIso8601String(), text: value);

                await controller.write(textModel);
                await controller.readAllTexts();
                _textController.clear();
              }
            },
          ),
        )
      ],
    );
  }

  Widget showEditDialog(
      BuildContext context, HomeController controller, TextModel textModel) {
    return SizedBox(
      height: 200,
      width: 250,
      child: AlertDialog(
        title: const Text(
          "Editar",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: TextField(
          focusNode: _focusNodeEdit,
          controller: _textControllerEdit,
          decoration: InputDecoration(
            label: _focusNode.hasFocus
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
              _textControllerEdit.clear();
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
              if (_textControllerEdit.text.isNotEmpty) {
                final textModelEditado = TextModel(
                    key: textModel.key, text: _textControllerEdit.text);
                await controller.edit(textModel, textModelEditado);
                await controller.readAllTexts();
                _textControllerEdit.clear();
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

  AlertDialog showRemoveDialog(
      BuildContext context, HomeController controller, TextModel textModel) {
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
