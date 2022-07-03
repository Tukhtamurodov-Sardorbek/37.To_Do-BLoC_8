part of 'todo_bloc.dart';

class ToDoEvent extends Equatable {
  const ToDoEvent();

  @override
  List<Object> get props => [];
}

class AddToDo extends ToDoEvent {
  final ToDo todo;
  const AddToDo({
    required this.todo,
  });
  @override
  List<Object> get props => [todo];
}

class UpdateToDo extends ToDoEvent {
  final ToDo todo;
  const UpdateToDo({
    required this.todo,
  });
  @override
  List<Object> get props => [todo];
}

class DeleteToDo extends ToDoEvent {
  final ToDo todo;
  const DeleteToDo({
    required this.todo,
  });
  @override
  List<Object> get props => [todo];
}

class RemoveToDo extends ToDoEvent {
  final ToDo todo;
  const RemoveToDo({
    required this.todo,
  });
  @override
  List<Object> get props => [todo];
}

class MarkFavoriteOrUnfavoriteToDO extends ToDoEvent {
  final ToDo todo;
  const MarkFavoriteOrUnfavoriteToDO({required this.todo});
  @override
  List<Object> get props => [todo];
}

class EditToDo extends ToDoEvent {
  final ToDo oldVersion;
  final ToDo newVersion;

  const EditToDo({
    required this.oldVersion,
    required this.newVersion,
  });

  @override
  List<Object> get props => [oldVersion, newVersion];
}
