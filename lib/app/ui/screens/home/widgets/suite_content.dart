import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_app/app/core/utils/formatter.dart';
import 'package:go_app/app/dependencies.dart';
import 'package:go_app/app/domain/entities/periodo.dart';
import 'package:go_app/app/domain/entities/suite.dart';
import 'package:go_app/app/ui/routes/myrouter_helper.dart';
import 'package:go_app/app/ui/screens/suite_items/suite_items_screen.dart';
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
                if (suite.exibirQtdDisponiveis)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.crisis_alert,
                        color: AppColors.of(context)?.alertColor,
                        size: 15,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'só mais ${suite.qtd} pelo app',
                        style: AppFonts.of(context)?.alertText,
                      )
                    ],
                  ),
                if (suite.exibirQtdDisponiveis) const SizedBox(height: 10),
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
                  child: InkWell(
                    onTap: () =>
                        context.pushFromBottom(SuiteItemsScreen(suite: suite)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'ver\ntodos',
                          textAlign: TextAlign.end,
                          style: AppFonts.of(context)?.label.copyWith(
                              color: AppColors.of(context)?.fieldColor),
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
                ),
              ],
            ),
          ),
          ...suite.periodos.map(
            (periodo) => Padding(
              padding: EdgeInsets.only(top: 5),
              child: _PricingCard(periodo: periodo),
            ),
          ),
        ],
      ),
    );
  }
}

class _PricingCard extends StatelessWidget {
  final Periodo periodo;

  const _PricingCard({required this.periodo});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 7, horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      periodo.tempoFormatado,
                      style: AppFonts.of(context)?.title,
                    ),
                    const SizedBox(width: 10),
                    if (periodo.porcentagemDesconto > 0)
                      _OffDiscount(percentage: periodo.porcentagemDesconto),
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    if (periodo.porcentagemDesconto > 0)
                      Text(
                        di.get<CurrencyFormatter>().format(periodo.valor),
                        style: AppFonts.of(context)?.title.copyWith(
                            decoration: TextDecoration.lineThrough,
                            color: AppColors.of(context)
                                ?.onBackgroundColor
                                .withValues(alpha: .6)),
                      ),
                    if (periodo.porcentagemDesconto > 0)
                      const SizedBox(width: 15),
                    Text(
                      di.get<CurrencyFormatter>().format(periodo.valorTotal),
                      style: AppFonts.of(context)?.title,
                    ),
                  ],
                )
              ],
            ),
          ),
          const Spacer(),
          Icon(
            Icons.chevron_right,
            size: 32,
            color: AppColors.of(context)?.fieldColor,
          ),
        ],
      ),
    );
  }
}

class _OffDiscount extends StatelessWidget {
  final double percentage;

  const _OffDiscount({required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.of(context)!.accentColor, width: 1),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        '${percentage.toStringAsFixed(0)}% off',
        style: AppFonts.of(context)?.accentText,
      ),
    );
  }
}
