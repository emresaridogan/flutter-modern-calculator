import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modern_calculator/bloc/theme_switch/theme_switch_bloc.dart';
import 'package:modern_calculator/ui/pages/home_page.dart';
import 'package:modern_calculator/ui/theme/app_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeSwitchBloc(),
        ),
      ],
      child: BlocBuilder<ThemeSwitchBloc, ThemeSwitchState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: state.switchValue
                ? AppThemes().appThemeData[AppTheme.Dark]
                : AppThemes().appThemeData[AppTheme.Light],
            home: HomePage(),
          );
        },
      ),
    );
  }
}
