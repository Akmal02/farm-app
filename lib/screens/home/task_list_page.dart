import 'package:flutter/material.dart';

import '../../widgets/sub_app_bar.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        SubAppBar(
          title: Text('Task list'),
          bottom: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Section: A', style: textTheme.subtitle2),
                  const SizedBox(width: 8),
                  const Icon(Icons.arrow_drop_down)
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Week 1, day 6', style: textTheme.subtitle2),
                  const SizedBox(width: 8),
                  const Icon(Icons.arrow_drop_down)
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Scrollbar(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Text('Repeating tasks', style: textTheme.subtitle2),
                const SizedBox(height: 12),
                _buildTaskCard(
                  context: context,
                  task: 'Keeping seed trays moist',
                  color: Colors.pink.shade200,
                ),
                const SizedBox(height: 24),
                Text('Full day tasks', style: textTheme.subtitle2),
                const SizedBox(height: 12),
                _buildTaskCard(
                  context: context,
                  task: 'Preparing polybags',
                  color: Colors.green.shade200,
                ),
                _buildTaskCard(
                  context: context,
                  task: 'Trellis setting',
                  color: Colors.green.shade500,
                ),
                const SizedBox(height: 24),
                Text('Morning tasks', style: textTheme.subtitle2),
                const SizedBox(height: 12),
                _buildTaskCard(
                  context: context,
                  task: 'Setting fruit fly traps',
                  color: Colors.orange.shade400,
                ),
                _buildTaskCard(
                  context: context,
                  task: 'Prepare fertigation',
                  color: Colors.orange.shade200,
                ),
                _buildTaskCard(
                  context: context,
                  task: 'Pest monitoring',
                  color: Colors.orange.shade200,
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildTaskCard(
      {required BuildContext context,
      required String task,
      required Color color}) {
    return Row(
      children: [
        const Icon(
          Icons.arrow_right,
          color: Colors.black54,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Card(
            color: color,
            child: ListTile(
              dense: true,
              title: Text(task),
            ),
          ),
        ),
      ],
    );
  }
}
