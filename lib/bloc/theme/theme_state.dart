part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final nightMode;
  const ThemeState({required this.nightMode});

  @override
  List<Object> get props => [nightMode];

  // * For Hydrated Storage
  // Map<String, dynamic> toMap() => {
  //   'todoList': todoList.map((e) => e.toMap()).toList(),
  //   'deletedList': deletedList.map((e) => e.toMap()).toList(),
  // };
  //
  // factory ToDoState.fromMap(Map<String, dynamic> map) => ToDoState(
  //   todoList: List<ToDo>.from(map['todoList']?.map((e) => ToDo.fromMap(e))),
  //   deletedList: List<ToDo>.from(
  //     map['deletedList']?.map((e) => ToDo.fromMap(e)),
  //   ),
  // );
}

class ThemeInitial extends ThemeState{
  const ThemeInitial({required bool nightMode}) : super(nightMode: nightMode);
}