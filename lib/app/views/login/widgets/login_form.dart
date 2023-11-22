part of '../login_view.dart';

class _LoginForm extends StatefulWidget {
  const _LoginForm({super.key});

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _userEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _userEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = LoginController();

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Column(children: [
          TextformFieldCustom(
            lable: "Usuário",
            controller: _userEC,
            validator: Validatorless.multiple([
              Validatorless.required("Campo obrigatório"),
              Validatorless.max(20, "O máximo de caracteres é 20"),
              (value) {
                if (value != null && value.toString().endsWith(' ')) {
                  return 'Senha não pode terminar com espaço';
                }
                return null;
              }
            ]),
          ),
          const SizedBox(height: 20),
          TextformFieldCustom(
            lable: "Senha",
            controller: _passwordEC,
            obscureText: true,
            validator: Validatorless.multiple(
              [
                Validatorless.required("Campo obrigatório"),
                Validatorless.min(2, "O mínimo de caracteres é 2"),
                Validatorless.max(20, "O máximo de caracteres é 20"),
                (value) {
                  if (value != null && value.toString().endsWith(' ')) {
                    return 'Não pode terminar com espaço';
                  }
                  return null;
                },
                (value) {
                  if (value != null &&
                      !RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value.toString())) {
                    return 'A senha não pode conter caracteres especiais';
                  }
                  return null;
                }
              ],
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButtonCustom(
            lable: "Entrar",
            onPressed: () {
              final formValid = _formKey.currentState?.validate() ?? false;

              if (formValid) {
                controller.login();

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InfoView(),
                  ),
                );
              }
            },
          ),
        ]),
      ),
    );
  }
}
