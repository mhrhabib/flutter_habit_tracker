import 'package:flutter/material.dart';
import 'package:tracker_app/constants/app_assets.dart';
import 'package:tracker_app/models/task_presets.dart';
import 'package:tracker_app/ui/task/animated_task.dart';
import 'package:tracker_app/ui/task/task_completion_ring.dart';
import 'package:tracker_app/ui/theming/app_theme.dart';

import 'grid_task.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.of(context).primary,
      body: const GridTask(
        tasks: [
          TaskPreset(name: 'Eat a Healthy Meal', iconName: AppAssets.carrot),
          TaskPreset(name: 'Walk the Dog', iconName: AppAssets.dog),
          TaskPreset(name: 'Do Some Coding', iconName: AppAssets.html),
          TaskPreset(name: 'Meditate', iconName: AppAssets.meditation),
          TaskPreset(name: 'Do 10 Pushups', iconName: AppAssets.pushups),
          TaskPreset(name: 'Sleep 8 Hours', iconName: AppAssets.rest),
          TaskPreset(name: 'Take Vitamins', iconName: AppAssets.vitamins),
        ],
      ),
    );
  }
}
