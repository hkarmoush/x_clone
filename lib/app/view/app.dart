import 'dart:io';

import 'package:flutter/cupertino.dart'
    show CupertinoApp, CupertinoColors, CupertinoThemeData;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_clone/app/view/auth/blocs/auth_bloc.dart';
import 'package:x_clone/app/view/configure_dependencies.dart';
import 'package:x_clone/app/view/routes.dart';
import 'package:x_clone/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<AuthBloc>()),
      ],
      child: Platform.isIOS
          ? buildCupertinoApp(context)
          : buildMaterialApp(context),
    );
  }

  Widget buildCupertinoApp(BuildContext context) {
    return CupertinoApp.router(
      theme: const CupertinoThemeData(
        primaryColor: CupertinoColors.systemBlue,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }

  Widget buildMaterialApp(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
