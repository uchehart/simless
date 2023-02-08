import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF2A62FF),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child:
                    Image.asset("assets/images/onboarding/onboardingImage.png"),
              ),
            ),
            Expanded(
              // flex: 2,
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  height: 600,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      )),
                  child: Stack(
                    children: [
                      const Divider(
                        indent: 150,
                        endIndent: 150,
                        height: 5,
                        thickness: 5,
                        color: Color(0xFFD9D9D9),
                      ),
                      SizedBox(
                        height: 600,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 50.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 40.0,
                                    vertical: 25,
                                  ),
                                  child: LoginTextField(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 40.0,
                                    vertical: 25,
                                  ),
                                  child: Column(
                                    children: const [
                                      LoginTextField(),
                                      Text("Have an account already? Login")
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 84.0,
                                    //vertical: 25,
                                  ),
                                  child: Button(text: "Sign Up"),
                                ),
                              ]),
                        ),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class LoginTextField extends StatelessWidget {
  const LoginTextField({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
          //  color: Color(0xFFF4F4F4),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          hintText: "Enter your email or Phone number",
          hintStyle: TextStyle(color: Color(0xFF676767))),
    );
  }
}

class Button extends StatelessWidget {
  const Button({Key? key, this.text}) : super(key: key);
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color(0xFF2773FB),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      height: 60,
      width: 260,
      child:
          Center(child: Text("$text", style: TextStyle(color: Colors.white))),
    );
  }
}
