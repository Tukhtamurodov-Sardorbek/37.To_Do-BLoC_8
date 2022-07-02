part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final nightMode;
  const ThemeState({required this.nightMode});

  @override
  List<Object> get props => [nightMode];

  // * For Hydrated Storage
  Map<String, dynamic> toMap() => {'nightMode': nightMode};

  factory ThemeState.fromMap(Map<String, dynamic> map) => ThemeState(
        nightMode: map['nightMode'] ?? false,
      );
}

class ThemeInitial extends ThemeState {
  const ThemeInitial({required bool nightMode}) : super(nightMode: nightMode);
}
