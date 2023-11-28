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

                    return TileWidget(
                      textEditingController: _textControllerEdit,
                      focusNode: _focusNodeEdit,
                      homeController: controller,
                      textModel: textModel,
                    );
                  },
                );
              }),
            ),
          ),
        ),
        HomeTextField(
          focusNode: _focusNode,
          homeController: controller,
          textEditingController: _textController,
        ),
      ],
    );
  }
}
