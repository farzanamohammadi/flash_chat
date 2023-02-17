import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat_starting_project/components/rounded_button.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flash_chat_starting_project/services/auth_service.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '/constants.dart';
import 'package:flutter/material.dart';
import 'chat_screen.dart';


class LoginScreen extends StatefulWidget {

  static const String id = "login_screen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String errMessage = '';
  bool errorOcurred = false, showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            const SizedBox(
              height: 48.0,
            ),
            Form(
              key: _formKey,
                child: Column(
              children: [
                TextFormField(
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your Email', labelText: 'Email'),
                  controller: _emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (email) {
                    return email != null && EmailValidator.validate(email)
                        ? null
                        : 'Please enter a valid email.';
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your password', labelText: 'Password'),
                  controller: _passwordController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (password) {
                    return password != null && password.length > 5
                        ? null
                        : 'The password shold be at least 6 charachter.';
                  },
                ),
              ],
            )),
            const SizedBox(
              height: 24.0,
            ),
            Visibility(
              visible: errorOcurred,
              child: Text(
                errMessage,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            ),
            RoundedButton(
                title: 'Log In',
                color: kLoginButtonColor,
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      setState(() {
                        errorOcurred = false;
                        showSpinner = true;
                      });
                      await AuthService()
                          .signInWithEmailAndPassword(
                              email: _emailController.text,
                              password: _passwordController.text)
                          .then((value) {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, ChatScreen.id);
                      });
                      setState(() {
                        showSpinner = false;
                      });
                    } catch (e) {
                      print('EROR ${e.toString()}');
                      setState(() {
                        showSpinner = false;
                        errorOcurred = true;
                        errMessage = e.toString().split('] ')[1];
                      });
                    }
                  }
                }),
            const SizedBox(height: 12),
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    ));
  }
}
