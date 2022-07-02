import '../bloc_exports.dart';
import '../../models/todo_model.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class ToDoBloc extends HydratedBloc<ToDoEvent, ToDoState> {
  // * For Hydrated Storage
  @override
  ToDoState? fromJson(Map<String, dynamic> json) => ToDoState.fromMap(json);

  @override
  Map<String, dynamic>? toJson(ToDoState state) => state.toMap();

  ToDoBloc() : super(const ToDoState()) {
    on<AddToDo>(_addToDo);
    on<UpdateToDo>(_updateToDo);
    on<DeleteToDo>(_deleteToDo);
    on<RemoveToDo>(_removeToDo);
  }

  void _addToDo(AddToDo event, Emitter<ToDoState> emit) {
    final state = this.state;
    emit(ToDoState(
      todoList: List.from(state.todoList)..add(event.todo),
    ));
  }

  void _updateToDo(UpdateToDo event, Emitter<ToDoState> emit) {
    final state = this.state;
    final todo = event.todo;
    final index = state.todoList.indexOf(todo);

    List<ToDo> todoList = List.from(state.todoList)..remove(todo);

    todo.isDone == false
        ? todoList.insert(index, todo.copyWith(isDone: true))
        : todoList.insert(index, todo.copyWith(isDone: false));

    emit(ToDoState(todoList: todoList));
  }

  void _deleteToDo(DeleteToDo event, Emitter<ToDoState> emit) {
    final state = this.state;
    emit(ToDoState(todoList: List.from(state.todoList)..remove(event.todo)));
  }

  void _removeToDo(RemoveToDo event, Emitter<ToDoState> emit) {
    final state = this.state;
    emit(
      ToDoState(
        todoList: List.from(state.todoList)..remove(event.todo),
        deletedList: List.from(state.deletedList)
          ..add(event.todo.copyWith(isDeleted: true)),
      ),
    );
  }
}
