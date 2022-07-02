import '../bloc_exports.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeInitial(nightMode: false)) {
    on<DarkThemeEvent>((event, emit) {
      emit(
        const ThemeState(nightMode: true),
      );
    });
    on<LightThemeEvent>((event, emit) {
      emit(
        const ThemeState(nightMode: false),
      );
    });
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) => ThemeState.fromMap(json);

  @override
  Map<String, dynamic>? toJson(ThemeState state) => state.toMap();
}