import 'package:farm_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/badge.dart';
import '../../widgets/sub_app_bar.dart';

class AlertsPage extends ConsumerWidget {
  const AlertsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: const [
                        CircleAvatar(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          child: Icon(Icons.settings),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                            child:
                                Text('Initial setup: Payday to day yourself')),
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
