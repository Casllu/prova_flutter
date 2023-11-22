import 'package:flutter/material.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Card(
        elevation: 8,
        child: Container(
          height: 250,
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: SizedBox(
                  height: 50,
                  child: Column(
                    children: [
                      LayoutBuilder(
                        builder: (context, constraints) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: constraints.maxWidth * 2 / 3,
                                child: Center(child: Text('Text')),
                              ),
                              IconButton(onPressed: (){}, icon: const Icon(Icons.edit_outlined)),
                              IconButton(onPressed: (){}, icon: const Icon(Icons.remove_circle_outline, color: Colors.red,)),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      const Divider()
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
