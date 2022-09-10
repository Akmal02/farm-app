class TransactionHistory {
  final double amount;
  final DateTime dateTime;
  final String remark;

  const TransactionHistory({
    required this.amount,
    required this.dateTime,
    required this.remark,
  });
}

final transactionHistories = [
  TransactionHistory(
    amount: 2000.00,
    dateTime: DateTime(2022, 4, 1),
    remark: 'Top-up transfer',
  ),
  TransactionHistory(
    amount: 2000.00,
    dateTime: DateTime(2022, 6, 1),
    remark: 'Top-up transfer',
  ),
  TransactionHistory(
    amount: -100.00,
    dateTime: DateTime(2022, 9, 4),
    remark: 'Equipment purchase',
  ),
  TransactionHistory(
    amount: -180.00,
    dateTime: DateTime(2022, 9, 10),
    remark: 'Equipment purchase',
  ),
  TransactionHistory(
    amount: -500.00,
    dateTime: DateTime(2022, 9, 1),
    remark: 'Maintenance fees',
  ),
  TransactionHistory(
    amount: 300.00,
    dateTime: DateTime(2022, 9, 10),
    remark: 'Top-up transfer',
  )
]..sort((a, b) => b.dateTime.compareTo(a.dateTime));
