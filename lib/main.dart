import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_app/app/dependencies.dart';
import 'package:go_app/app/ui/routes/myrouter_generator.dart';
import 'package:go_app/app/ui/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  initDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return FutureBuilder(
      future: di.allReady(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final router = di.get<MyRouterGenerator>();
        final appTheme = di.get<AppTheme>();

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'GoApp',
          theme: ThemeData(
            primaryColor: appTheme.appColors.primaryColor,
            extensions: [
              appTheme.appColors,
              appTheme.appFonts,
            ],
          ),
          onGenerateRoute: router.onGenerateRoute,
        );
      },
    );
  }
}
