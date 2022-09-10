import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/transaction_history.dart';

class BalancePage extends StatefulWidget {
  const BalancePage({Key? key}) : super(key: key);

  @override
  State<BalancePage> createState() => _BalancePageState();
}

class _BalancePageState extends State<BalancePage> {
  String _historyDateFilter = '30d';

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
                const Icon(
                  Icons.account_balance_wallet,
                  size: 48,
                  color: Colors.black54,
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Current balance',
                      style: textTheme.subtitle1,
                    ),
                    const SizedBox(height: 4),
                    Text(
                        'RM ${transactionHistories.fold<double>(0, (sum, item) => sum + item.amount).toStringAsFixed(2)}',
                        style: textTheme.headline5!
                            .copyWith(fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.all(16.0) - const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Transaction history', style: textTheme.subtitle2),
              const SizedBox(height: 8),
              CupertinoSlidingSegmentedControl<String>(
                children: const {
                  '30d': Text('30 days'),
                  '3mo': Text('3 months'),
                  '6mo': Text('6 months'),
                },
                groupValue: _historyDateFilter,
                onValueChanged: (val) {
                  setState(() {
                    _historyDateFilter = val!;
                  });
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              for (final item in transactionHistories.where(() {
                if (_historyDateFilter == '30d') {
                  return (TransactionHistory item) => item.dateTime.isAfter(
                      DateTime.now().subtract(const Duration(days: 30)));
                } else if (_historyDateFilter == '3mo') {
                  return (TransactionHistory item) => item.dateTime.isAfter(
                      DateTime.now().subtract(const Duration(days: 90)));
                } else if (_historyDateFilter == '6mo') {
                  return (TransactionHistory item) => item.dateTime.isAfter(
                      DateTime.now().subtract(const Duration(days: 180)));
                } else {
                  throw UnimplementedError('Unknown date filter');
                }
              }()))
                Card(
                  child: ListTile(
                    isThreeLine: true,
                    leading: item.amount < 0
                        ? const Icon(
                            Icons.north_east,
                            color: Colors.red,
                          )
                        : const Icon(
                            Icons.south_west,
                            color: Colors.green,
                          ),
                    title: Text('RM ${item.amount.abs().toStringAsFixed(2)}'),
                    subtitle: Text(
                        '${item.dateTime.toIso8601String().substring(0, 10)}\n'
                        '${item.remark}'),
                  ),
                )
            ],
          ),
        )
      ],
    );
  }
}
