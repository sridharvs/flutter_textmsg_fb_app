import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  void Function()? onTap;
  MyButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green,
          //color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 130),
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }
}
