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
      pendingList: List.from(state.pendingList)..add(event.todo),
      completedList: state.completedList,
      favoriteList: state.favoriteList,
      deletedList: state.deletedList,
    ));
  }

  void _updateToDo(UpdateToDo event, Emitter<ToDoState> emit) {
    final state = this.state;
    final todo = event.todo;
    // final index = state.todoList.indexOf(todo);

    List<ToDo> pendingList = state.pendingList;
    List<ToDo> completedList = state.completedList;

    // todo.isDone == false
    //     ? todoList.insert(index, todo.copyWith(isDone: true))
    //     : todoList.insert(index, todo.copyWith(isDone: false));

    if (todo.isDone) {
      completedList = List.from(pendingList)..remove(todo);
      pendingList = List.from(completedList)
        ..insert(0, todo.copyWith(isDone: false));
    } else {
      pendingList = List.from(pendingList)..remove(todo);
      completedList = List.from(completedList)
        ..insert(0, todo.copyWith(isDone: true),);
    }
    emit(
      ToDoState(
        pendingList: pendingList,
        completedList: completedList,
        favoriteList: state.favoriteList,
        deletedList: state.deletedList,
      ),
    );
  }

  void _deleteToDo(DeleteToDo event, Emitter<ToDoState> emit) {
    final state = this.state;
    emit(
      ToDoState(
        // todoList: List.from(state.todoList)..remove(event.todo),
        pendingList: state.pendingList,
        completedList: state.completedList,
        favoriteList: state.favoriteList,
        deletedList: List.from(state.deletedList)..remove(event.todo),
      ),
    );
  }

  void _removeToDo(RemoveToDo event, Emitter<ToDoState> emit) {
    final state = this.state;
    emit(
      ToDoState(
        // todoList: List.from(state.todoList)..remove(event.todo),
        pendingList: List.from(state.pendingList)..remove(event.todo),
        completedList: List.from(state.completedList)..remove(event.todo),
        favoriteList: List.from(state.favoriteList)..remove(event.todo),
        deletedList: List.from(state.deletedList)
          ..add(event.todo.copyWith(isDeleted: true)),
      ),
    );
  }
}
