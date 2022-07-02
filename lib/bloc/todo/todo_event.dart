part of 'todo_bloc.dart';

class ToDoEvent extends Equatable {
  const ToDoEvent();

  @override
  List<Object> get props => [];
}

class AddToDo extends ToDoEvent{
  final ToDo todo;
  const AddToDo({
    required this.todo,
});
  @override
  List<Object> get props => [todo];
}

class UpdateToDo extends ToDoEvent{
  final ToDo todo;
  const UpdateToDo({
    required this.todo,
});
  @override
  List<Object> get props => [todo];
}

class DeleteToDo extends ToDoEvent{
  final ToDo todo;
  const DeleteToDo({
    required this.todo,
});
  @override
  List<Object> get props => [todo];
}