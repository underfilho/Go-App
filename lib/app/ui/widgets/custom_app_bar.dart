import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_app/app/ui/theme/app_colors.dart';
import 'package:go_app/app/ui/theme/app_fonts.dart';
import 'package:go_app/app/ui/widgets/custom_switch.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 38,
          width: double.infinity,
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.menu,
                  color: AppColors.of(context)?.containerColor,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: CustomSwitch(
                    firstOption: 'ir agora',
                    secondOption: 'ir outro dia',
                    firstIcon: Icons.access_time_rounded,
                    secondIcon: Icons.calendar_month_outlined,
                    initial: SwitchOption.first,
                    onToggle: (_) {},
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: AppColors.of(context)?.containerColor,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('zona norte', style: AppFonts.of(context)?.caption),
              Transform.rotate(
                angle: pi / 2,
                child: Icon(
                  Icons.chevron_right,
                  color: AppFonts.of(context)?.caption.color,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
