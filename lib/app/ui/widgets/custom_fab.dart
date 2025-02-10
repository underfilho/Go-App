import 'package:flutter/material.dart';
import 'package:go_app/app/ui/theme/app_colors.dart';
import 'package:go_app/app/ui/theme/app_fonts.dart';

class CustomFAB extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomFAB({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: AppColors.of(context)?.containerColor,
          borderRadius: BorderRadius.all(Radius.circular(40)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: .5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 1),
            ),
          ],
        ),
        height: 42,
        width: 100,
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.map_outlined,
                color: AppColors.of(context)?.primaryColor,
                size: 20,
              ),
              const SizedBox(width: 4),
              Text(
                'mapa',
                style: AppFonts.of(context)
                    ?.caption
                    .copyWith(color: AppColors.of(context)?.primaryColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
