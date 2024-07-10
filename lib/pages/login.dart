import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:verademo_dart/controllers/internal_controller.dart';
import 'package:verademo_dart/controllers/login_controller.dart';
import 'package:verademo_dart/theme/theme.dart';
import 'package:verademo_dart/utils/constants.dart';
import 'package:verademo_dart/widgets/stateful_checkbox.dart';
import 'register.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: VTheme.loginTheme,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: VConstants.loginSpacing,
            child: Column (
              children: [
                const SizedBox(height: 150),
                _loginTitle(context),
                const SizedBox(height: 10),
                _loginSubtitle(context),
                const SizedBox(height: 58),
                _loginForm(context),
                const SizedBox(height: 85),
                _signUpText(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text _loginSubtitle(BuildContext context) {
    return Text(
      "The home of witty one-liners",
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: VConstants.lightNeutral2)
    );
  }

  Form _loginForm(BuildContext context) {
    return Form(
      child: Column(
        children: [
          _credField('Username', context),
          const SizedBox(height: VConstants.textFieldSpacing),
          _credField('Password', context),
          _rememberMe(),
          const SizedBox(height: 30),
          _loginButton(context),
        ],
      ),
    );
  }

  Padding _rememberMe() {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(value: false, onChanged: (value) {}),
          const Text("Remember me")
        ],
      ),
    );
  }

  Text _signUpText(BuildContext context) {
    return Text.rich(
      TextSpan(children: [
        const TextSpan(text: "Don't have an account? "),
        TextSpan(
          text: "Sign Up",
          // style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.blue),
          style: const TextStyle(
            color: Colors.blue
          ),
          recognizer: TapGestureRecognizer()..onTap = () {
            print("Sign up");
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegisterPage()));
          }
        ),
      ]),
    );
  }

  Row _loginTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Image(
          height: 48,
          image: AssetImage(VConstants.vcIcon)
        ),
        const SizedBox(width: 9.2),
        Text("Blab-a-Gag", style: Theme.of(context).textTheme.titleMedium?.copyWith(color: VConstants.codeWhite)),
        const SizedBox(width: 4),
      ],
    );
  }

  ElevatedButton _loginButton(BuildContext context) {
    return ElevatedButton(
      child: const Text('Login'),
      onPressed: () {
        Navigator.push(context,
        MaterialPageRoute(builder: (context) => const HomePage(username: 'test')),);
      },
    );
  }

  TextFormField _credField(String placeholder, BuildContext context) {
    return TextFormField (
      
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        hintText: placeholder,
      ),
    );
  }
}

// class _CheckBoxState extends State<Checkbox> {
//   bool rememberMe = false;

//   @override
//   Widget build(BuildContext context) {
//     return Checkbox(
//       value: rememberMe,
//       onChanged: ((bool? newValue) {
//         setState(() {
//           rememberMe = newValue ?? true;
//           if (rememberMe) {

//           } else {

//           }
//         });
//       })
//     );
//   }
// }

class _LoginForm extends StatelessWidget {
  const _LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = LoginController();

    return Form(
      child: Column(
        children: [
          TextFormField (
            textAlignVertical: TextAlignVertical.center,
            decoration: const InputDecoration(
              hintText: "Username",
            ),
          ),
          const SizedBox(height: VConstants.textFieldSpacing),
          TextFormField (
            textAlignVertical: TextAlignVertical.center,
            decoration: const InputDecoration(
              hintText: "Password",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                VCheckbox(value: controller.rememberMe, onChanged: ((bool? newValue) {
                  print("Controller remember me was ${controller.rememberMe}");
                  controller.rememberMe = newValue ?? true;
                  print("Controller remember me set to ${controller.rememberMe}");
                  if (controller.rememberMe) {

                  } else {

                  }
                })),
                const Text("Remember me")
              ],
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            child: const Text('Login'),
            onPressed: () {
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomePage(username: 'test')),);
            },
          ),
        ],
      ),
    );
  }
}