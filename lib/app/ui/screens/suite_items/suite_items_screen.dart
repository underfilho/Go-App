import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_app/app/domain/entities/categoria_item.dart';
import 'package:go_app/app/domain/entities/suite.dart';
import 'package:go_app/app/ui/routes/myrouter_helper.dart';
import 'package:go_app/app/ui/theme/app_colors.dart';
import 'package:go_app/app/ui/theme/app_fonts.dart';

class SuiteItemsScreen extends StatelessWidget {
  final Suite suite;

  const SuiteItemsScreen({super.key, required this.suite});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.of(context)?.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.of(context)?.backgroundColor,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Transform.rotate(
            angle: pi / 2,
            child: Icon(
              Icons.chevron_right,
              color: AppColors.of(context)?.onBackgroundColor,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              suite.nome,
              style: AppFonts.of(context)?.title.copyWith(fontSize: 24),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          _Title(label: 'principais itens'),
          const SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                childAspectRatio: 3,
              ),
              itemCount: suite.categoriaItens.length,
              itemBuilder: (context, index) {
                return _CategoryItem(item: suite.categoriaItens[index]);
              },
            ),
          ),
          const SizedBox(height: 15),
          _Title(label: 'tem também'),
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              suite.itens.map((e) => e.nome).join(', '),
              style: AppFonts.of(context)?.bodyText,
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final CategoriaItem item;

  const _CategoryItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(item.icone, width: 35, height: 35),
        ),
        const SizedBox(width: 3),
        Expanded(
          child: Text(
            item.nome,
            style: AppFonts.of(context)?.bodyText,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}

class _Title extends StatelessWidget {
  final String label;

  const _Title({required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1.5,
            margin: EdgeInsets.symmetric(horizontal: 15),
            color: AppColors.of(context)?.fieldColor,
          ),
        ),
        Text(label, style: AppFonts.of(context)?.bodyTextTitle),
        Expanded(
          child: Container(
            height: 1.5,
            margin: EdgeInsets.symmetric(horizontal: 15),
            color: AppColors.of(context)?.fieldColor,
          ),
        ),
      ],
    );
  }
}
