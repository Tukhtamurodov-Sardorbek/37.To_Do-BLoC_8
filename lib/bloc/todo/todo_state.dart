part of 'todo_bloc.dart';

class ToDoState extends Equatable {
  final List<ToDo> todoList;
  const ToDoState({
    this.todoList = const <ToDo>[],
  });

  @override
  List<Object> get props => [todoList];

  // * For Hydrated Storage
  Map<String, dynamic> toMap() => {
    'todoList' : todoList.map((e) => e.toMap()).toList(),
  };

  factory ToDoState.fromMap(Map<String, dynamic> map) => ToDoState(
    todoList: List<ToDo>.from(map['todoList']?.map((e) => ToDo.fromMap(e))),
  );
}

// class ToDoInitial extends ToDoState{}
