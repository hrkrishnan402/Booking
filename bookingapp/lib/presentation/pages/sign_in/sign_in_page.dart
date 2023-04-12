import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../validators.dart';
import '../sign_up_page/widgets/sign_up_textfield.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: SizedBox(
            height: 500,
            width: 700,
            child: Card(
              color: Colors.white,
              elevation: 5.0,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Sign In",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 26),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Center(
                          child: Text("Its free and always will be.",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                        ),
                      ),
                      SignUpTextField(
                        hintText: "User Name",
                        controller: userNameController,
                        validator: (value) =>
                            AppValidators.nameValidator(
                                userNameController.text) ??
                            "",
                      ),
                      SignUpTextField(
                        hintText: "Password",
                        controller: passwordController,
                        validator: (value) =>
                            AppValidators.passwordValidator(
                                passwordController.text) ??
                            "",
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  print("success");
                                }
                              },
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 68, 85, 233),
                                padding: const EdgeInsets.all(16.0),
                                textStyle: const TextStyle(fontSize: 20),
                              ),
                              child: const Text(
                                "Submit",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("Forgot Password",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 12)),
                          Text("|",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                          Text("Are you a new user?",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                          Text("Register",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 12)),
                        ]
                            .map((e) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  child: e,
                                ))
                            .toList(),
                      ),
                      const Text(
                        "Sign In Using",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 26),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 207, 77, 54),
                          padding: const EdgeInsets.all(16.0),
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        child: const Text(
                          "Google",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
