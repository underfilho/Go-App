import 'package:flutter/material.dart';
import 'package:go_app/app/ui/theme/app_colors.dart';
import 'package:go_app/app/ui/widgets/custom_switch.dart';

class HomeWrapper extends StatefulWidget {
  final Widget appBar;
  final Widget firstScreen;
  final Widget secondScreen;
  final WrapperController controller;

  const HomeWrapper({
    super.key,
    required this.appBar,
    required this.firstScreen,
    required this.secondScreen,
    required this.controller,
  });

  @override
  State<HomeWrapper> createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper> {
  var screen = WrapperScreen.first;

  @override
  void initState() {
    super.initState();
    widget.controller._setSelectScreenCall((value) {
      setState(() => screen = value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.of(context)?.primaryColor,
      child: Column(
        children: [
          widget.appBar,
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                color: AppColors.of(context)?.backgroundColor,
              ),
              child: screen == WrapperScreen.first
                  ? widget.firstScreen
                  : widget.secondScreen,
            ),
          ),
        ],
      ),
    );
  }
}

class WrapperController {
  void Function(WrapperScreen)? _selectScreen;

  void Function(WrapperScreen)? get selectScreen => _selectScreen;

  void _setSelectScreenCall(void Function(WrapperScreen screen) select) {
    _selectScreen = select;
  }
}

enum WrapperScreen {
  first,
  second;

  static WrapperScreen fromSwitchOption(SwitchOption option) {
    return option == SwitchOption.first
        ? WrapperScreen.first
        : WrapperScreen.second;
  }
}
