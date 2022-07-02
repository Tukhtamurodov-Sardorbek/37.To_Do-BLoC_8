part of 'todo_bloc.dart';

class ToDoState extends Equatable {
  final List<ToDo> todoList;
  const ToDoState({
    this.todoList = const <ToDo>[],
  });

  @override
  List<Object> get props => [todoList];
}

// class ToDoInitial extends ToDoState{}
