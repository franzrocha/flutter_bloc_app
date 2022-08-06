part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final bool themeValue;

  const ThemeState({required this.themeValue});

  @override
  List<Object> get props => [themeValue];

  Map<String, dynamic> toMap() {
    return {
      'themeValue': themeValue,
    };
  }

  factory ThemeState.fromMap(Map<String, dynamic> map) {
    return ThemeState(
      themeValue: map['themeValue'] ?? false,
    );
  }
}

class ThemeInitial extends ThemeState {
  const ThemeInitial({required bool themeValue})
      : super(themeValue: themeValue);
}