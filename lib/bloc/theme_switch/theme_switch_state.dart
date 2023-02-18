part of 'theme_switch_bloc.dart';

class ThemeSwitchState extends Equatable {
  final bool switchValue;
  const ThemeSwitchState({required this.switchValue});

  @override
  List<Object> get props => [switchValue];
}

class ThemeSwitchInitial extends ThemeSwitchState {
  ThemeSwitchInitial({required bool switchValue}) : super(switchValue: false);
}
