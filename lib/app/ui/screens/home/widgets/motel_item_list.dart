import 'dart:math';

import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:go_app/app/domain/entities/motel.dart';
import 'package:go_app/app/ui/screens/home/widgets/suite_content.dart';
import 'package:go_app/app/ui/theme/app_colors.dart';
import 'package:go_app/app/ui/theme/app_fonts.dart';

class MotelItemList extends StatelessWidget {
  final Motel motel;

  const MotelItemList({super.key, required this.motel});

  @override
  Widget build(BuildContext context) {
    final controller = PageController(viewportFraction: .9);

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipOval(child: Image.network(motel.logo, width: 45, height: 45)),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(motel.fantasia, style: AppFonts.of(context)?.title),
                  Text(motel.bairro, style: AppFonts.of(context)?.subtitle),
                  const SizedBox(height: 5),
                  _Rating(motel: motel),
                ],
              ),
              const Spacer(),
              Padding(padding: EdgeInsets.only(top: 5), child: _LikeHeart()),
            ],
          ),
        ),
        ExpandablePageView(
          allowImplicitScrolling: true,
          controller: controller,
          children:
              motel.suites.map((suite) => SuiteContent(suite: suite)).toList(),
        )
      ],
    );
  }
}

class _Rating extends StatelessWidget {
  final Motel motel;

  const _Rating({required this.motel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(width: 1, color: const Color(0xffffb100)),
          ),
          padding: EdgeInsets.all(2),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.star, color: const Color(0xffffb100), size: 16),
              Text(
                motel.media.toStringAsFixed(1),
                style: AppFonts.of(context)?.label,
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Text(
          '${motel.qtdAvaliacoes} avaliações',
          style: AppFonts.of(context)?.label,
        ),
        const SizedBox(width: 2),
        Transform.rotate(
          angle: pi / 2,
          child: Icon(
            Icons.chevron_right,
            size: 18,
            color: AppFonts.of(context)?.label.color,
          ),
        ),
      ],
    );
  }
}

class _LikeHeart extends StatefulWidget {
  const _LikeHeart();

  @override
  State<_LikeHeart> createState() => __LikeHeartState();
}

class __LikeHeartState extends State<_LikeHeart> {
  bool liked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => liked = !liked),
      child: Icon(
        Icons.favorite,
        size: 30,
        color: !liked ? AppColors.of(context)?.fieldColor : Colors.red,
      ),
    );
  }
}
