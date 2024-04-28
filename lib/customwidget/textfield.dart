import 'dart:async';

import 'package:flutter/material.dart';

class customtextfield extends StatelessWidget {
  const customtextfield(
      {super.key,
      this.label,
      this.prefix,
      this.val,
      this.controller,
      this.obsecure,
      this.suffix,
      this.keybordtype,
      this.readonly,
      this.style});
  final label;
  final prefix;
  final val;
  final controller;
  final obsecure;
  final suffix;
  final keybordtype;
  final style;
  final readonly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readonly ?? false,
      style: style,
      keyboardType: keybordtype,
      obscureText: obsecure ?? false,
      controller: controller,
      validator: val,
      decoration: InputDecoration(
        label: label,
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
        prefixIcon: prefix,
        suffixIcon: suffix,
      ),
    );
  }
}
