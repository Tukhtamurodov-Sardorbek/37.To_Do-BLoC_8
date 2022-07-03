part of 'todo_bloc.dart';

class ToDoState extends Equatable {
  final List<ToDo> pendingList;
  final List<ToDo> completedList;
  final List<ToDo> savedList;
  final List<ToDo> deletedList;
  const ToDoState({
    this.pendingList = const <ToDo>[],
    this.completedList = const <ToDo>[],
    this.savedList = const <ToDo>[],
    this.deletedList = const <ToDo>[],
  });

  @override
  List<Object> get props => [
        pendingList,
        completedList,
        savedList,
        deletedList,
      ];

  // * For Hydrated Storage
  Map<String, dynamic> toMap() => {
        'pendingList': pendingList.map((e) => e.toMap()).toList(),
        'completedList': completedList.map((e) => e.toMap()).toList(),
        'savedList': savedList.map((e) => e.toMap()).toList(),
        'deletedList': deletedList.map((e) => e.toMap()).toList(),
      };

  factory ToDoState.fromMap(Map<String, dynamic> map) => ToDoState(
        pendingList: List<ToDo>.from(
          map['pendingList']?.map((e) => ToDo.fromMap(e)),
        ),
        completedList: List<ToDo>.from(
          map['completedList']?.map((e) => ToDo.fromMap(e)),
        ),
        savedList: List<ToDo>.from(
          map['savedList']?.map((e) => ToDo.fromMap(e)),
        ),
        deletedList: List<ToDo>.from(
          map['deletedList']?.map((e) => ToDo.fromMap(e)),
        ),
      );
}

// class ToDoInitial extends ToDoState{}
