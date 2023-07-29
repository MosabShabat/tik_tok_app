import 'package:get/get.dart';

import '../../../constants.dart';
import '../../widgets/text_input_field.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: context.screenHeight / 5,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              'Tiktok Clone'
                  .text
                  .size(35)
                  .color(buttonColor)
                  .fontWeight(FontWeight.w900)
                  .make(),
              'Register'.text.size(25).fontWeight(FontWeight.w700).make(),
              25.heightBox,
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(
                        'https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png'),
                    backgroundColor: Colors.black,
                  ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: () => authController.pickImage(),
                      icon: const Icon(
                        Icons.add_a_photo,
                      ),
                    ),
                  ),
                ],
              ),
              25.heightBox,
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                  keyboardType: TextInputType.name,
                  controller: _usernameController,
                  labelText: 'Username',
                  icon: Icons.person,
                ),
              ),
              15.heightBox,
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
              15.heightBox,
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                  keyboardType: TextInputType.text,
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
                  onTap: () => authController.registerUser(
                    _usernameController.text,
                    _emailController.text,
                    _passwordController.text,
                    authController.profilePhoto,
                  ),
                  child: Center(
                    child: 'Register'
                        .text
                        .size(20)
                        .fontWeight(FontWeight.w700)
                        .make(),
                  ),
                ),
              ),
              15.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  'Already have an account? '.text.size(20).white.make(),
                  InkWell(
                    onTap: () {
                      Get.to(
                        () => LoginScreen(),
                        transition: Transition.rightToLeft,
                      );
                    },
                    child: 'Login'.text.size(20).color(buttonColor).make(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ).box.height(context.screenHeight).make(),
    );
  }
}
