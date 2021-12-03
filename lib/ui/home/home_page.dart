import 'package:flutter/material.dart';
import 'package:tracker_app/ui/task/task_completion_ring.dart';
import 'package:tracker_app/ui/theming/app_theme.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.of(context).primary,
      body: Center(child: SizedBox(height: 240, child: TaskCompletionRing())),
    );
  }
}
