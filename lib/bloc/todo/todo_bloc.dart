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
    on<AddToDo>(_create);
    on<UpdateToDo>(_update);
    on<DeleteToDo>(_delete);
    on<RemoveToDo>(_remove);
    on<MarkFavoriteOrUnfavoriteToDO>(_mark);
    on<EditToDo>(_edit);
    // on<RestoreToDo>(_restore);
    // on<DeleteAllToDo>(_deleteAll);
  }

  void _create(AddToDo event, Emitter<ToDoState> emit) {
    final state = this.state;
    emit(ToDoState(
      pendingList: List.from(state.pendingList)..add(event.todo),
      completedList: state.completedList,
      savedList: state.savedList,
      deletedList: state.deletedList,
    ));
  }

  void _update(UpdateToDo event, Emitter<ToDoState> emit) {
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
        ..insert(
          0,
          todo.copyWith(isDone: true),
        );
    }
    emit(
      ToDoState(
        pendingList: pendingList,
        completedList: completedList,
        savedList: state.savedList,
        deletedList: state.deletedList,
      ),
    );
  }

  void _delete(DeleteToDo event, Emitter<ToDoState> emit) {
    final state = this.state;
    emit(
      ToDoState(
        // todoList: List.from(state.todoList)..remove(event.todo),
        pendingList: state.pendingList,
        completedList: state.completedList,
        savedList: state.savedList,
        deletedList: List.from(state.deletedList)..remove(event.todo),
      ),
    );
  }

  void _remove(RemoveToDo event, Emitter<ToDoState> emit) {
    final state = this.state;
    emit(
      ToDoState(
        // todoList: List.from(state.todoList)..remove(event.todo),
        pendingList: List.from(state.pendingList)..remove(event.todo),
        completedList: List.from(state.completedList)..remove(event.todo),
        savedList: List.from(state.savedList)..remove(event.todo),
        deletedList: List.from(state.deletedList)
          ..add(event.todo.copyWith(isDeleted: true)),
      ),
    );
  }

  void _mark(MarkFavoriteOrUnfavoriteToDO event, Emitter<ToDoState> emit) {
    final state = this.state;
    final todo = event.todo;
    List<ToDo> pendingTodo = state.pendingList;
    List<ToDo> completedTodo = state.completedList;
    List<ToDo> savedTodo = state.savedList;
    final pendingIndex = pendingTodo.indexOf(todo);
    final completedIndex = completedTodo.indexOf(todo);

    if (!todo.isDone) {
      if (!todo.isSaved) {
        pendingTodo = List.from(pendingTodo)
          ..remove(todo)
          ..insert(pendingIndex, todo.copyWith(isSaved: true));
        savedTodo.insert(0, todo.copyWith(isSaved: true));
      } else {
        pendingTodo = List.from(pendingTodo)
          ..remove(todo)
          ..insert(pendingIndex, todo.copyWith(isSaved: false));
        savedTodo.remove(todo);
      }
    } else {
      if (!todo.isSaved) {
        completedTodo = List.from(completedTodo)
          ..remove(todo)
          ..insert(completedIndex, todo.copyWith(isSaved: true));
        savedTodo.insert(0, todo.copyWith(isSaved: true));
      } else {
        completedTodo = List.from(completedTodo)
          ..remove(todo)
          ..insert(completedIndex, todo.copyWith(isSaved: false));
        savedTodo.remove(todo);
      }
    }

    emit(
      ToDoState(
        pendingList: pendingTodo,
        completedList: completedTodo,
        savedList: savedTodo,
        deletedList: state.deletedList,
      ),
    );
  }

  void _edit(EditToDo event, Emitter<ToDoState> emit) {
    final state = this.state;
    List<ToDo> savedToDo = state.savedList;

    if (event.oldVersion.isSaved) {
      savedToDo
        ..remove(event.oldVersion)
        ..insert(0, event.newVersion);
    }

    emit(
      ToDoState(
        pendingList: List.from(state.pendingList)
          ..remove(event.oldVersion)
          ..insert(0, event.newVersion),
        completedList: state.completedList..remove(event.oldVersion),
        savedList: savedToDo,
        deletedList: state.deletedList,
      ),
    );
  }
}
