
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeInitial(themeValue: false)) {
    on<ThemeOnEvent>((event, emit) {
      emit(const ThemeState(themeValue: true));
    });

    on<ThemeOffEvent>((event, emit) {
      emit(const ThemeState(themeValue: false));
    });
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    return ThemeState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    return state.toMap();
  }
}