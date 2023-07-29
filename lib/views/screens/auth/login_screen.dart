import 'package:get/get.dart';
import 'package:tik_tok_app/constants.dart';
import 'package:tik_tok_app/views/screens/auth/signup_screen.dart';
import '../../widgets/text_input_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            'hello world'
                .text
                .size(25)
                .color(buttonColor)
                .fontWeight(FontWeight.w900)
                .make(),
            'Login'.text.size(25).white.fontWeight(FontWeight.w900).make(),
            25.heightBox,
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                labelText: 'Email',
                icon: Icons.email,
              ),
            ),
            25.heightBox,
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(
                keyboardType: TextInputType.name,
                controller: _passwordController,
                labelText: 'Password',
                icon: Icons.lock,
                isObscure: true,
              ),
            ),
            30.heightBox,
            Container(
              width: MediaQuery.of(context).size.width - 40,
              height: 50,
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: InkWell(
                onTap: () {
                  authController.loginUser(
                    _emailController.text.trim(),
                    _passwordController.text.trim(),
                  );
                },
                child: Center(
                  child: 'Login'
                      .text
                      .size(25)
                      .white
                      .fontWeight(FontWeight.w700)
                      .make(),
                ),
              ),
            ),
            15.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                'Don\'t have an account? '
                    .text
                    .size(20)
                    .white
                    .fontWeight(FontWeight.w700)
                    .make(),
                InkWell(
                  onTap: () {
                    Get.to(
                      () => SignUpScreen(),
                      transition: Transition.leftToRight,
                    );
                  },
                  child: 'Register'
                      .text
                      .size(20)
                      .color(buttonColor)
                      .fontWeight(FontWeight.w700)
                      .make(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
