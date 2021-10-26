import 'package:flutter/material.dart';
import 'package:linkso/resources/theme.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    this.onPressed,
    required this.text,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Text(
          text,
          style: Theme.of(context).textTheme.n14.copyWith(color: Theme.of(context).colorScheme.secondary),
        ),
      ),
    );
  }
}
