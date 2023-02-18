import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_switch_event.dart';
part 'theme_switch_state.dart';

class ThemeSwitchBloc extends Bloc<ThemeSwitchEvent, ThemeSwitchState> {
  ThemeSwitchBloc() : super(ThemeSwitchInitial(switchValue: false)) {
    on<ThemeSwitchOnEvent>((event, emit) {
      emit(
        const ThemeSwitchState(switchValue: true),
      );
    });
    on<ThemeSwitchOffEvent>((event, emit) {
      emit(
        const ThemeSwitchState(switchValue: false),
      );
    });
  }
}
