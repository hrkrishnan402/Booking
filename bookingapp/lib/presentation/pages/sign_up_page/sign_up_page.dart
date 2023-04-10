import 'package:bookingapp/presentation/pages/sign_up_page/widgets/sign_up_textfield.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final textController = TextEditingController();
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
              child: Column(
                children: [
                  const Text(
                    "Create an Account",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  const Center(
                    child: Text("Its free and always will be.",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12)),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SignUpTextField(
                          hintText: "First Name",
                          controller: textController,
                        ),
                      ),
                      Expanded(
                        child: SignUpTextField(
                          hintText: "Last Name",
                          controller: textController,
                        ),
                      ),
                    ],
                  ),
                  SignUpTextField(
                    hintText: "Mobile",
                    controller: textController,
                  ),
                  SignUpTextField(
                    hintText: "Email",
                    controller: textController,
                  ),
                  SignUpTextField(
                    hintText: "Password",
                    controller: textController,
                  ),
                  SignUpTextField(
                    hintText: "Confirm Password",
                    controller: textController,
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 68, 85, 233),
                      padding: const EdgeInsets.all(16.0),
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    child: const Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
    );
  }
}
