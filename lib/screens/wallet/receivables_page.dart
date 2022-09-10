import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReceivablesPage extends StatelessWidget {
  const ReceivablesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 2),
        Material(
          color: Colors.white,
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.payments,
                  size: 48,
                  color: Colors.black54,
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Harvest sales',
                      style: textTheme.subtitle1,
                    ),
                    const SizedBox(height: 4),
                    Text('RM 1,200.00',
                        style: textTheme.headline5!
                            .copyWith(fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0) - EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Transaction history', style: textTheme.subtitle2),
              const SizedBox(height: 8),
              CupertinoSlidingSegmentedControl(
                children: {
                  '30d': Text('30 days'),
                  '3mo': Text('3 months'),
                  '6mo': Text('6 months'),
                },
                groupValue: '30d',
                onValueChanged: (val) {},
              ),
            ],
          ),
        ),
        Container(
          height: 400,
          child: Center(child: Text('No receivables yet')),
        )
      ],
    );
  }
}
