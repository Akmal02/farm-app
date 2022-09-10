import 'package:farm_app/screens/wallet/balance_page.dart';
import 'package:farm_app/screens/wallet/receivables_page.dart';
import 'package:flutter/material.dart';

import '../commons/app_drawer.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Wallet'),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Material(
              color: Colors.white,
              elevation: 2,
              child: TabBar(
                indicatorColor: Theme.of(context).colorScheme.primary,
                labelColor: Theme.of(context).colorScheme.primary,
                unselectedLabelColor: Colors.black54,
                isScrollable: true,
                tabs: [
                  Tab(text: 'Balance'),
                  Tab(text: 'Receivables'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [BalancePage(), ReceivablesPage()],
              ),
            )
          ],
        ),
      ),
    );
  }
}
