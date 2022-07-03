part of 'todo_bloc.dart';

class ToDoEvent extends Equatable {
  const ToDoEvent();

  @override
  List<Object> get props => [];
}

class CreateEvent extends ToDoEvent {
  final ToDo todo;
  const CreateEvent({
    required this.todo,
  });
  @override
  List<Object> get props => [todo];
}

class UpdateEvent extends ToDoEvent {
  final ToDo todo;
  const UpdateEvent({
    required this.todo,
  });
  @override
  List<Object> get props => [todo];
}

class DeleteEvent extends ToDoEvent {
  final ToDo todo;
  const DeleteEvent({
    required this.todo,
  });
  @override
  List<Object> get props => [todo];
}

class RemoveEvent extends ToDoEvent {
  final ToDo todo;
  const RemoveEvent({
    required this.todo,
  });
  @override
  List<Object> get props => [todo];
}

class MarkEvent extends ToDoEvent {
  final ToDo todo;
  const MarkEvent({required this.todo});
  @override
  List<Object> get props => [todo];
}

class EditEvent extends ToDoEvent {
  final ToDo oldVersion;
  final ToDo newVersion;

  const EditEvent({
    required this.oldVersion,
    required this.newVersion,
  });

  @override
  List<Object> get props => [oldVersion, newVersion];
}

class RestoreEvent extends ToDoEvent {
  final ToDo todo;

  const RestoreEvent({
    required this.todo
  });

  @override
  List<Object> get props => [todo];
}
