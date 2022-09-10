import 'package:farm_app/widgets/badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/sub_app_bar.dart';
import 'home_screen.dart';

class NotificationsPage extends ConsumerWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                for (int i = 0; i < 3; i++)
                  Card(
                    margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.orange,
                            foregroundColor: Colors.white,
                            child: Icon(Icons.notifications),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                              child: Text(
                                  'RM 100.00 has been deducted from your wallet')),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
