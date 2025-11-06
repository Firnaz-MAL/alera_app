import 'package:alera_app/modules/auth(ibrohim)/login_page.dart';
import 'package:alera_app/modules/auth(ibrohim)/register_controller.dart';
import 'package:alera_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class RegisterPage extends GetView<RegisterController> {
  final TextEditingController emailController = TextEditingController();
  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.only(bottom: 50),
          width: 500,
          height: 750,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(19),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 2),
                blurRadius: 4,
                color: primaryColor,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo/alera-bg-reamove.png',
                width: 150,
                height: 150,
              ),
              Text(
                "Let's Get Started",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 25),
              textFieldCustom(emailController, 'Email', 'Email Address'),
              SizedBox(height: 15),
              PasswordField(),
              SizedBox(height: 15),
              ConfirPassword(),
              SizedBox(height: 20),
              
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 173, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(20),
                  ),
                ),
                child: Text('SIGNUP'),
              ),
              SizedBox(height: 10),
              Text('Or Sign up With', style: TextStyle(fontSize: 10)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(FontAwesomeIcons.google, size: 45, color: primaryColor),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      FontAwesomeIcons.facebook,
                      size: 45,
                      color: primaryColor,
                    ),
                  ),
                  SizedBox(width: 20),
                  Icon(FontAwesomeIcons.apple, size: 45, color: primaryColor),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have Account?"),
                  TextButton(onPressed: () {
                    controller.returnToLogin();
                  }, child: Text('Sign In')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget textFieldCustom(
    TextEditingController controller,
    String label,
    String hint,
  ) {
    return SizedBox(
      width: 400,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          labelText: label,
          hintText: hint,
        ),
      ),
    );
  }
}
