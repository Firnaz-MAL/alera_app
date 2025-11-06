import 'package:alera_app/modules/auth(ibrohim)/login_controller.dart';
import 'package:alera_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.only(bottom: 50),
          width: 500,
          height: 700,
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
                'Welcome Back to Alera!',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 25),
              textFieldCustom(emailController, 'Email', 'Email Address'),
              SizedBox(height: 15),
              PasswordField(),
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
                child: Text('LOGIN'),
              ),
              SizedBox(height: 10),
              Text('Or Login With', style: TextStyle(fontSize: 10)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(FontAwesomeIcons.google, size: 45, color: primaryColor,),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(FontAwesomeIcons.facebook, size: 45, color: primaryColor,),
                  ),
                  SizedBox(width: 20),
                  Icon(FontAwesomeIcons.apple, size: 45, color: primaryColor,),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have any Account?"),
                  TextButton(onPressed: () {
                    controller.navigateToRegisterForm();
                  }, child: Text('Sign Up'))
                ],
              )
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

class PasswordField extends StatefulWidget {
  const PasswordField({super.key});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isObscure = true; // ⛔ default: disembunyikan

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 400,
          child: TextField(
            obscureText: _isObscure, // 🎯 inilah kuncinya
            decoration: InputDecoration(
              labelText: 'Password',
              contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              prefixIcon: const Icon(Icons.lock_outline), // 🔒 icon di kiri
              suffixIcon: IconButton(
                icon: Icon(
                  _isObscure
                      ? Icons.visibility_off
                      : Icons.visibility, // 👁️ toggle
                ),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure; // 🔄 ubah dari hide → show
                  });
                },
              ),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ),
      ],
    );
  }
}

class ConfirPassword extends StatefulWidget {
  const ConfirPassword({super.key});

  @override
  State<ConfirPassword> createState() => _ConfirPasswordState();
}

class _ConfirPasswordState extends State<ConfirPassword> {
 bool _isObscure = true; 


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 400,
          child: TextField(
            obscureText: _isObscure, // 🎯 inilah kuncinya
            decoration: InputDecoration(
              labelText: 'Confirm Password',
              contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              prefixIcon: const Icon(Icons.lock_outline), // 🔒 icon di kiri
              suffixIcon: IconButton(
                icon: Icon(
                  _isObscure
                      ? Icons.visibility_off
                      : Icons.visibility, // 👁️ toggle
                ),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure; // 🔄 ubah dari hide → show
                  });
                },
              ),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ),
      ],
    );
  }
}
