import 'package:flutter/cupertino.dart';

class AccountOptionModel {
  final String iconPath;
  final String optionWord;
  final VoidCallback optionPress;

  AccountOptionModel(
      {required this.iconPath,
      required this.optionWord,
      required this.optionPress});
}
