import 'package:flutter/material.dart';

class SubAppBar extends StatelessWidget {
  const SubAppBar(
      {Key? key, required this.title, this.leading, this.trailing, this.bottom})
      : super(key: key);

  final Widget title;
  final Widget? leading;
  final Widget? trailing;
  final Widget? bottom;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      elevation: 2,
      color: Colors.white,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: leading ?? const SizedBox()),
                const SizedBox(width: 16),
                DefaultTextStyle(
                  style: textTheme.headline6!,
                  textAlign: TextAlign.center,
                  child: title,
                ),
                const SizedBox(width: 16),
                Expanded(child: trailing ?? const SizedBox()),
              ],
            ),
            if (bottom != null) ...[
              const SizedBox(height: 16),
              bottom!,
            ],
          ],
        ),
      ),
    );
  }
}
