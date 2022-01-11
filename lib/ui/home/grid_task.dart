import 'package:flutter/material.dart';
import 'package:tracker_app/models/task_presets.dart';
import 'package:tracker_app/ui/task/task_with_name.dart';

class GridTask extends StatelessWidget {
  final List<TaskPreset> tasks;
  const GridTask({Key? key, required this.tasks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 0.8,
        ),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return TaskWithName(task: task);
        },
      ),
    );
  }
}
