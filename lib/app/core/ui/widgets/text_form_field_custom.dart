import 'package:flutter/material.dart';

//TextFormFild Padrão
class TextformFieldCustom extends StatelessWidget {
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final String lable;
  final bool obscureText;
  final ValueNotifier<bool> _obscureTextVN;

  TextformFieldCustom({
    super.key,
    required this.lable,
    this.obscureText = false,
    this.controller,
    this.validator,
  }) : _obscureTextVN = ValueNotifier<bool>(obscureText);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _obscureTextVN,
      builder: (_, obscureTextVNValue, __) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 14),
              child: Text(
                lable,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            TextFormField(
              controller: controller,
              validator: validator,
              obscureText: obscureTextVNValue,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: obscureText
                    ? IconButton(
                        onPressed: () {
                          _obscureTextVN.value = !obscureTextVNValue;
                        },
                        icon: Icon(
                          obscureTextVNValue ? Icons.lock : Icons.lock_open,
                          color: Colors.black,
                        ),
                      )
                    : const Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  List<Object?> get props =>
      [controller, validator, lable, obscureText, _obscureTextVN];
}
