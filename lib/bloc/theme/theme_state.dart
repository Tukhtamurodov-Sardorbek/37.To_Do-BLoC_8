part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final nightMode;
  const ThemeState({required this.nightMode});

  @override
  List<Object> get props => [nightMode];
}

class ThemeInitial extends ThemeState{
  const ThemeInitial({required bool nightMode}) : super(nightMode: nightMode);
}