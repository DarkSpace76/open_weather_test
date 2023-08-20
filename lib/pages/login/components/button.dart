import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget authButton({Function()? onPressed}) {
  return CupertinoButton(
    padding: EdgeInsets.zero,
    onPressed: onPressed,
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
      decoration: BoxDecoration(
          color: const Color(0xFF0700FF),
          borderRadius: BorderRadius.circular(24)),
      child: const Center(
        child: Text("Войти",
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: Colors.white)),
      ),
    ),
  );
}
