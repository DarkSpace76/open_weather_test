// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_weather_test/utils/icon.dart';

class LoginInput extends StatefulWidget {
  final String? hint;
  final TextEditingController? controller;
  bool makePass = false;

  LoginInput({super.key, this.hint, this.controller});

  LoginInput.makePass({super.key, this.hint, this.controller}) {
    makePass = true;
  }

  @override
  State<LoginInput> createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginInput> {
  bool showPassword = false;

  void eyePress() => setState(() => showPassword = !showPassword);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.makePass ? null : (value) => validateEmail(value),
      controller: widget.controller,
      decoration: InputDecoration(
          hintText: widget.hint,
          suffixIcon: !widget.makePass
              ? null
              : eyeIcon(
                  asset: !showPassword ? LoginAssets.eyeOff : LoginAssets.eyeOn,
                  onPressed: eyePress,
                )),
      obscureText: widget.makePass ? !showPassword : false,
    );
  }
}

Widget eyeIcon({required String asset, Function()? onPressed}) {
  return CupertinoButton(
    onPressed: onPressed,
    padding: EdgeInsets.zero,
    child: SvgPicture.asset(
      asset,
      width: 24,
      height: 24,
      fit: BoxFit.none,
    ),
  );
}

String? validateEmail(String? value) {
  const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
  final regex = RegExp(pattern);

  return value!.isNotEmpty && !regex.hasMatch(value)
      ? 'Enter a valid email address'
      : null;
}
