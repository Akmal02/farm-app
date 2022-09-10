import 'package:farm_app/screens/home/home_screen.dart';
import 'package:farm_app/screens/login_register/login_screen.dart';
import 'package:farm_app/screens/wallet/wallet_screen.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuItems = [
      MenuItem(
        label: 'Home',
        icon: Icons.home,
        onTap: () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen())),
      ),
      MenuItem(
        label: 'Wallet',
        icon: Icons.wallet,
        submenus: [
          MenuItem(
            label: 'Wallet',
            icon: Icons.wallet,
            onTap: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const WalletScreen())),
          ),
          const MenuItem(label: 'Pay Worker', icon: Icons.group),
          const MenuItem(label: 'Pay Temp. Harvest', icon: Icons.engineering),
          const MenuItem(label: 'Pay Yourself', icon: Icons.person),
          const MenuItem(label: 'Drawdown', icon: Icons.money),
        ],
      ),
      const MenuItem(
        label: 'Inventory',
        icon: Icons.inventory,
        submenus: [
          MenuItem(label: 'Inventory', icon: Icons.inventory),
          MenuItem(label: 'Stock-take', icon: Icons.inventory_outlined),
          MenuItem(label: 'Order for Cycle', icon: Icons.description),
          MenuItem(label: 'Order for Problems', icon: Icons.construction),
        ],
      ),
      const MenuItem(
        label: 'Crop Cycle Operations',
        icon: Icons.refresh,
        submenus: [
          MenuItem(label: 'Crop Cycle Operations', icon: Icons.refresh)
        ],
      )
    ];

    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text('Nurul'),
                  accountEmail: Text('nurul@example.com'),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white54,
                    foregroundImage: NetworkImage(
                        'https://avatars.dicebear.com/api/adventurer/344.png'),
                  ),
                ),
                for (final item in menuItems) _buildListItem(context, item)
              ],
            ),
          ),
          const Divider(),
          _buildListItem(
            context,
            const MenuItem(
              label: 'Manually Sync Database',
              icon: Icons.refresh,
            ),
          ),
          _buildListItem(
            context,
            MenuItem(
                label: 'Log Out',
                icon: Icons.logout,
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                }),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(BuildContext context, MenuItem item,
      {bool bold = true}) {
    if (item.submenus != null) {
      return ExpansionTile(
        title: Text(item.label,
            style: TextStyle(
                fontWeight: bold ? FontWeight.bold : FontWeight.normal)),
        leading: Icon(item.icon),
        children: item.submenus!
            .map((e) => _buildListItem(context, e, bold: false))
            .toList(),
      );
    } else {
      return ListTile(
        title: Text(
          item.label,
          style:
              TextStyle(fontWeight: bold ? FontWeight.bold : FontWeight.normal),
        ),
        leading: Icon(item.icon),
        onTap: item.onTap,
      );
    }
  }
}

class MenuItem {
  final String label;
  final IconData? icon;
  final VoidCallback? onTap;
  final List<MenuItem>? submenus;

  const MenuItem({
    required this.label,
    this.icon,
    this.onTap,
    this.submenus,
  });
}
