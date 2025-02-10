import 'package:flutter/material.dart';
import 'package:go_app/app/ui/theme/app_colors.dart';

class HomeWrapper extends StatelessWidget {
  final Widget appBar;
  final Widget body;

  const HomeWrapper({super.key, required this.appBar, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.of(context)?.primaryColor,
      child: Column(
        children: [
          appBar,
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                color: AppColors.of(context)?.backgroundColor,
              ),
              child: body,
            ),
          ),
        ],
      ),
    );
  }
}
