import '../bloc_exports.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial(nightMode: false)) {
    on<DarkThemeEvent>(
        (event, emit) {
          emit(
            const ThemeState(nightMode: true),
          );
        }
    );
    on<LightThemeEvent>(
        (event, emit) {
          emit(
            const ThemeState(nightMode: false),
          );
        }
    );
  }
}
