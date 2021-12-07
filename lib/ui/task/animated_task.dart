import 'package:flutter/material.dart';
import 'package:tracker_app/constants/app_assets.dart';
import 'package:tracker_app/ui/common_widgets/centered_svg_icon.dart';
import 'package:tracker_app/ui/task/task_completion_ring.dart';
import 'package:tracker_app/ui/theming/app_theme.dart';

class AnimatedTask extends StatefulWidget {
  final String iconName;
  const AnimatedTask({Key? key, required this.iconName}) : super(key: key);

  @override
  _AnimatedTaskState createState() => _AnimatedTaskState();
}

class _AnimatedTaskState extends State<AnimatedTask>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  bool _showCheckIcon = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 750,
      ),
    );
    _animation = _controller.drive(CurveTween(curve: Curves.easeInOut));
    _controller.addStatusListener(_checkIconStatus);
    // _controller.forward();
    // _controller.addListener(() {
    //   setState(() {});
    // });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _checkIconStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      setState(() {
        _showCheckIcon = true;
      });
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          _showCheckIcon = false;
        });
      });
    }
  }

  void _handleTapDown(TapDownDetails details) {
    if (_controller.status != AnimationStatus.completed) {
      _controller.forward();
    } else if (!_showCheckIcon) {
      _controller.value = 0.0;
    }
  }

  void _handleTapUp(TapUpDetails details) {
    if (_controller.status != AnimationStatus.completed) {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          final themeData = AppTheme.of(context);
          final progress = _animation.value;
          final hasCompleted = progress == 1.0;
          final iconColor =
              hasCompleted ? themeData.accentNegative : themeData.taskIcon;
          return Stack(
            children: [
              TaskCompletionRing(
                progress: progress,
              ),
              Positioned.fill(
                child: CenteredSvgIcon(
                  iconName: hasCompleted && _showCheckIcon
                      ? AppAssets.check
                      : widget.iconName,
                  color: iconColor,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
