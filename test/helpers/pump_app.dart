import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iq_weather/app/app.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp({
    required Widget child,
    List<BlocProvider>? providers,
    StackRouter? router,
    TabsRouter? tabsRouter,
    ThemeMode? themeMode,
    Locale? locale,
  }) async {
    Widget home = Scaffold(
      body: child,
    );

    if (providers != null) {
      home = MultiBlocProvider(
        providers: providers,
        child: home,
      );
    }

    if (router != null) {
      home = RouterScope(
        controller: router,
        stateHash: 0,
        inheritableObserversBuilder: List.empty,
        child: StackRouterScope(
          controller: router,
          stateHash: 0,
          child: home,
        ),
      );
    }

    if (tabsRouter != null) {
      home = RouterScope(
        controller: tabsRouter,
        stateHash: 0,
        inheritableObserversBuilder: List.empty,
        child: TabsRouterScope(
          controller: tabsRouter,
          stateHash: 0,
          child: home,
        ),
      );
    }

    await pumpWidget(
      App.test(
        home: home,
        themeMode: themeMode,
        locale: locale,
      ),
    );
  }
}
