import 'package:flutter/material.dart';
import 'package:go_app/app/ui/theme/app_colors.dart';
import 'package:go_app/app/ui/theme/app_fonts.dart';

class CustomSwitch extends StatefulWidget {
  final String firstOption;
  final String secondOption;
  final IconData firstIcon;
  final IconData secondIcon;
  final SwitchOption initial;
  final void Function(SwitchOption) onToggle;

  const CustomSwitch({
    super.key,
    required this.firstOption,
    required this.secondOption,
    required this.firstIcon,
    required this.secondIcon,
    required this.initial,
    required this.onToggle,
  });

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  late SwitchOption option;

  @override
  void initState() {
    super.initState();
    option = widget.initial;
  }

  bool get isFirstOption => option == SwitchOption.first;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;

      return GestureDetector(
        onTap: () {
          setState(() {
            option = SwitchOption.values.firstWhere((e) => e != option);
          });
          widget.onToggle(option);
        },
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.of(context)?.primaryDarkColor,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            AnimatedSlide(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              offset: option == SwitchOption.first
                  ? Offset.zero
                  : const Offset(1, 0),
              child: Container(
                width: width / 2,
                decoration: BoxDecoration(
                  color: AppColors.of(context)?.containerColor,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(
              height: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    flex: 1,
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _AnimatedIcon(
                            icon: widget.firstIcon,
                            color: isFirstOption
                                ? AppColors.of(context)?.primaryColor
                                : AppColors.of(context)?.containerColor,
                          ),
                          const SizedBox(width: 4),
                          _AnimatedText(
                            text: widget.firstOption,
                            color: isFirstOption
                                ? AppColors.of(context)?.onBackgroundColor
                                : AppColors.of(context)?.containerColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _AnimatedIcon(
                            icon: widget.secondIcon,
                            color: !isFirstOption
                                ? AppColors.of(context)?.primaryColor
                                : AppColors.of(context)?.containerColor,
                          ),
                          const SizedBox(width: 4),
                          _AnimatedText(
                            text: widget.secondOption,
                            color: !isFirstOption
                                ? AppColors.of(context)?.onBackgroundColor
                                : AppColors.of(context)?.containerColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}

class _AnimatedText extends StatelessWidget {
  final String text;
  final Color? color;

  const _AnimatedText({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
      style: AppFonts.of(context)!.caption.copyWith(color: color),
      child: Text(text),
    );
  }
}

class _AnimatedIcon extends StatelessWidget {
  final IconData icon;
  final Color? color;

  const _AnimatedIcon({required this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) =>
          ScaleTransition(scale: animation, child: child),
      child: Icon(icon, color: color, size: 20),
    );
  }
}

enum SwitchOption { first, second }
