import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_app/app/dependencies.dart';
import 'package:go_app/app/ui/theme/app_fonts.dart';
import 'package:go_app/app/ui/widgets/custom_fab.dart';
import 'package:go_app/app/ui/screens/home/widgets/home_wrapper.dart';
import 'package:go_app/app/ui/screens/home/widgets/motel_item_list.dart';
import 'package:go_app/app/ui/theme/app_colors.dart';
import 'package:go_app/app/ui/widgets/custom_app_bar.dart';

import 'cubits/home_cubit.dart';
import 'cubits/home_state.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (_) => di.get(),
      child: const _HomePage(),
    );
  }
}

class _HomePage extends StatefulWidget {
  const _HomePage();

  @override
  State<_HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage> {
  final controller = WrapperController();

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.of(context)?.primaryColor,
      body: SafeArea(
        child: HomeWrapper(
          controller: controller,
          appBar: CustomAppBar(onToggle: (option) {
            controller.selectScreen!(WrapperScreen.fromSwitchOption(option));
          }),
          firstScreen: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state.status == HomeStatus.loading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.of(context)?.primaryColor,
                  ),
                );
              }

              if (state.status == HomeStatus.loading) {
                return _FailedLoadingWidget();
              }

              final moteis = state.moteis!;

              return RefreshIndicator(
                onRefresh: () async => context.read<HomeCubit>().init(),
                color: AppColors.of(context)?.primaryColor,
                child: ListView.builder(
                  itemCount: moteis.length,
                  itemBuilder: (_, id) {
                    final isLastItem = id == moteis.length - 1;

                    return Padding(
                      padding: EdgeInsets.only(bottom: isLastItem ? 80 : 0),
                      child: MotelItemList(motel: moteis[id]),
                    );
                  },
                ),
              );
            },
          ),
          secondScreen: Container(),
        ),
      ),
      floatingActionButton: CustomFAB(onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _FailedLoadingWidget extends StatelessWidget {
  const _FailedLoadingWidget();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Text(
          'Ocorreu um erro ao carregar os dados.',
          style: AppFonts.of(context)?.title,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
