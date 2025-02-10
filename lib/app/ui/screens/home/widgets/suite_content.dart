import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_app/app/domain/entities/suite.dart';
import 'package:go_app/app/ui/theme/app_colors.dart';
import 'package:go_app/app/ui/theme/app_fonts.dart';
import 'package:go_app/app/ui/widgets/app_card.dart';

class SuiteContent extends StatelessWidget {
  final Suite suite;

  const SuiteContent({super.key, required this.suite});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppCard(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    suite.fotos.first,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  suite.nome,
                  style: AppFonts.of(context)?.title.copyWith(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          const SizedBox(height: 5),
          AppCard(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...suite.categoriaItens.sublist(0, 4).map((item) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(item.icone, width: 60, height: 60),
                  );
                }),
                SizedBox(
                  height: 60,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'ver\ntodos',
                        textAlign: TextAlign.end,
                        style: AppFonts.of(context)
                            ?.label
                            .copyWith(color: AppColors.of(context)?.fieldColor),
                      ),
                      const SizedBox(width: 5),
                      Transform.rotate(
                        angle: pi / 2,
                        child: Icon(
                          Icons.chevron_right,
                          size: 18,
                          color: AppColors.of(context)?.fieldColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
