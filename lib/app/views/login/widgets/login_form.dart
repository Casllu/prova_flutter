part of '../login_view.dart';

class _LoginForm extends StatefulWidget {
  const _LoginForm();

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
              //Criei esse validador para funcionar no padão do package Validatorless
              validatorEndsWhithSpace(_userEC.text, 'Usuário'),
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
                //Criei esses dois validadores para funcionar no padão do package Validatorless
                validatorEndsWhithSpace(_passwordEC.text, 'Senha'),
                validatorNotContaisSpecialCharacters(_passwordEC.text)
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeView(),
                  ),
                );
              }
            },
          ),
        ]),
      ),
    );
  }

  //Criei esses dois validadores para funcionar no padão do package Validatorless
  FormFieldValidator<String> validatorEndsWhithSpace(String v, String campo) {
    return (v) {
      if (v != null && v.toString().endsWith(' ')) {
        return '$campo não pode terminar com espaço';
      }
      return null;
    };
  }

  FormFieldValidator<String> validatorNotContaisSpecialCharacters(String v) {
    return (v) {
      if (v != null && !RegExp(r'^[a-zA-Z0-9]+$').hasMatch(v.toString())) {
        return 'A senha não pode conter caracteres especiais';
      }
      return null;
    };
  }
}
