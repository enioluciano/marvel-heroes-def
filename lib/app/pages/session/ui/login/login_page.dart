import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:project_test/app/core/util/size_and_colors.dart';
import './login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(28.0, 0, 28, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/images/marvel.jpeg', width: 160, height: 80),
              Column(
                children: [
                  _formField(
                      hintText: 'Login', icon: Icons.person_outline_outlined),
                  const SizedBox(height: THIRTY),
                  _formField(
                      hintText: 'Senha', icon: Icons.lock_outline_rounded),
                  const SizedBox(height: THIRTY),
                  _button(),
                ],
              ),
              Column(
                children: [
                  _details(),
                  const SizedBox(height: THIRTY),
                  _socialNetworks(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _formField({required String hintText, required IconData icon}) {
    return TextFormField(
        style: TextStyle(color: Colors.grey[600]),
        keyboardType: TextInputType.text,
        cursorColor: primaryColor,
        decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: grey, width: 1),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColor, width: 2),
            ),
            contentPadding: const EdgeInsets.all(10),
            fillColor: primaryColor,
            focusColor: primaryColor,
            prefixIconConstraints:
                const BoxConstraints(minHeight: 10, minWidth: 5),
            hintText: hintText,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(icon),
            )));
  }

  Widget _button() {
    return SizedBox(
      height: 50,
      width: 200,
      child: ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            )),
            backgroundColor: MaterialStateProperty.all(primaryColor)),
        onPressed: controller.navigationForHome,
        child: const Text(
          'Entrar',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
        ),
      ),
    );
  }

  Widget _details() {
    return Row(
      children: const [
        Expanded(child: Divider(thickness: 2)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text('ou'),
        ),
        Expanded(child: Divider(thickness: 2)),
      ],
    );
  }

  Widget _socialNetworks() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _social(path: 'assets/images/facebook.svg'),
        _social(path: 'assets/images/instagram.svg'),
        _social(path: 'assets/images/twitter.svg'),
      ],
    );
  }

  Widget _social({required String path}) {
    return CircleAvatar(
      backgroundColor: primaryColor,
      radius: 24,
      child: CircleAvatar(
          radius: 23, backgroundColor: white, child: SvgPicture.asset(path)),
    );
  }
}
