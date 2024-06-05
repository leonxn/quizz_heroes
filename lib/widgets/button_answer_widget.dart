import 'package:flutter/material.dart';
import 'package:flutter_images_explorer/constans/constans.dart';

class ButtonAnswerWidget extends StatefulWidget {
  String nameAnswer;
  VoidCallback onPressed;
  Color colorAnswer;

  ButtonAnswerWidget({
    required this.nameAnswer,
    required this.onPressed,
    required this.colorAnswer,
  });
  @override
  State<ButtonAnswerWidget> createState() => _ButtonAnswerWidgetState();
}

class _ButtonAnswerWidgetState extends State<ButtonAnswerWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: double.infinity,
          child: MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            onPressed: widget.onPressed,
            color: widget.colorAnswer,
            child: Text(
              widget.nameAnswer,
              style: textoButton,
            ),
          ),
        ),
      ),
    );
  }
}
