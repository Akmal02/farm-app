import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  const Badge({Key? key, required this.label, required this.color})
      : super(key: key);

  final Widget label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: DefaultTextStyle(
        style: textTheme.bodyText1!.copyWith(color: Colors.white),
        child: label,
      ),
    );
  }
}
