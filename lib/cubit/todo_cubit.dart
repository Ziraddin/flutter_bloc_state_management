import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state_management/models/todo_model.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super(List.empty());

  void addTodo({required String name}) {
    if (name.isEmpty) return addError("Name cannot be empty");
    Todo todo = Todo(name: name, createdAt: DateTime.now());
    emit([...state, todo]);
  }

  @override
  void onChange(Change<List<Todo>> change) {
    // TODO: implement onChange
    super.onChange(change);
    print("TodoCubit - $change");
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(error, stackTrace);
    print("TodoCubit - $error");
  }
}
