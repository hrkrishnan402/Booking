import 'package:bookingapp/presentation/pages/sign_up_page/widgets/sign_up_textfield.dart';
import 'package:bookingapp/presentation/validators.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final firstNameController = TextEditingController();
  final secondNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
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
                    children: [
                      const Text(
                        "Create an Account",
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
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: SignUpTextField(
                                hintText: "First Name",
                                controller: firstNameController,
                                validator: (value) =>
                                    AppValidators.nameValidator(
                                        firstNameController.text) ??
                                    "",
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: SignUpTextField(
                                hintText: "Last Name",
                                controller: secondNameController,
                                validator: (value) =>
                                    AppValidators.nameValidator(
                                        secondNameController.text) ??
                                    "",
                              ),
                            ),
                          ],
                        ),
                      ),
                      ...signupTextFields(),
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
                          Text("Are you already a member?"),
                          Text("Log In",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                        ],
                      )
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

  List<Widget> signupTextFields() {
    return [
      SignUpTextField(
        hintText: "Mobile",
        controller: phoneNumberController,
        validator: (value) =>
            AppValidators.phoneNumberValidator(phoneNumberController.text) ??
            "",
      ),
      SignUpTextField(
        hintText: "Email",
        controller: emailController,
        validator: (value) =>
            AppValidators.phoneNumberValidator(emailController.text) ?? "",
      ),
      SignUpTextField(
        hintText: "Password",
        controller: passwordController,
        validator: (value) =>
            AppValidators.phoneNumberValidator(passwordController.text) ?? "",
      ),
      SignUpTextField(
        hintText: "Confirm Password",
        controller: confirmPasswordController,
        validator: (value) =>
            AppValidators.phoneNumberValidator(
                confirmPasswordController.text) ??
            "",
      ),
    ]
        .map((e) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: e,
            ))
        .toList();
  }
}
