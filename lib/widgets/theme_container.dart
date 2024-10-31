import 'package:flutter/material.dart';

class ThemeContainer extends StatelessWidget {
  final void Function()? onTapTheme;
  final String themeText;
  final bool isTapped;
  const ThemeContainer(
      {super.key,
      required this.onTapTheme,
      required this.themeText,
      required this.isTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapTheme,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
        margin: const EdgeInsets.only(right: 3),
        decoration: BoxDecoration(
            color: isTapped
                ? Theme.of(context).colorScheme.inversePrimary
                : Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                width: 0.5,
                color: Theme.of(context).colorScheme.inversePrimary)),
        child: Center(
          child: Text(
            themeText,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: isTapped
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.inversePrimary),
          ),
        ),
      ),
    );
  }
}
