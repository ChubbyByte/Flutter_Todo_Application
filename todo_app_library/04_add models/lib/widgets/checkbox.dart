import 'package:flutter/material.dart'; //cSpell:disable

class CheckBox extends StatelessWidget {
  const CheckBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
    );
  }
}
