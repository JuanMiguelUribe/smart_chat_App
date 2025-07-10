import 'package:flutter/src/widgets/framework.dart';

enum FromWho{
  me,
  friend}
class Message{
  final String text;
  final String? imageUrl;
  final FromWho fromWho;

  Message({required this.text, this.imageUrl, required this.fromWho,});

  static of(BuildContext context) {}
}