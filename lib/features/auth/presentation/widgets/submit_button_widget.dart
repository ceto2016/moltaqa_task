import 'package:flutter/material.dart';
import '../../../../core/constant/constant.dart';

class SubmitButton extends StatelessWidget {
  final Function function;
  final String title;
  final IconData? bottomIcon;

  const SubmitButton(
      {Key? key, required this.function, required this.title, this.bottomIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: Constant.colorGrediant,
            begin: AlignmentDirectional.centerStart,
            end: AlignmentDirectional.centerEnd),
        borderRadius: BorderRadius.circular(30),
      ),
      child: ElevatedButton(
        onPressed: () {
          function();
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        child: Text(
          title,
          style: Constant.bodyTextWhite16,
        ),
      ),
    );
  }
}
