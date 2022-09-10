import 'package:farm_app/screens/home/alerts_page.dart';
import 'package:farm_app/screens/home/notifications_page.dart';
import 'package:farm_app/screens/home/task_list_page.dart';
import 'package:farm_app/widgets/badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../commons/app_drawer.dart';

final homeScreenTabProvider = StateProvider((ref) => 0);

class HomeScreen extends ConsumerStatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late final _controller = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<int>(homeScreenTabProvider, (previous, next) {
      _controller.animateToPage(next,
          duration: const Duration(milliseconds: 500), curve: standardEasing);
    });
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          Expanded(
            // child: PageView(
            //   controller: _controller,
            //   children: [
            //     AlertsPage(),
            //     NotificationsPage(),
            //   ],
            // ),
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  Material(
                    elevation: 1,
                    color: Colors.white,
                    child: TabBar(
                      indicatorColor: Theme.of(context).colorScheme.primary,
                      labelColor: Theme.of(context).colorScheme.primary,
                      unselectedLabelColor: Colors.black54,
                      tabs: [
                        Tab(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text('Alerts'),
                              SizedBox(width: 8),
                              Badge(label: Text('1'), color: Colors.red)
                            ],
                          ),
                        ),
                        Tab(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text('Notifications'),
                              SizedBox(width: 8),
                              Badge(label: Text('3'), color: Colors.orange)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Expanded(
                    child: TabBarView(
                      children: [
                        AlertsPage(),
                        NotificationsPage(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            color: Theme.of(context).colorScheme.primary,
            height: 2,
          ),
          const Expanded(
            child: TaskListPage(),
          ),
        ],
      ),
    );
  }
}
