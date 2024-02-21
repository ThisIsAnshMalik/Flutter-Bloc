import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learning/models/todo_model.dart';

class TodoCubit extends Cubit<List<TodoModel>> {
  TodoCubit() : super([]);

  void addTodo(String title) {
    final todo = TodoModel(name: title, createdAt: DateTime.now());
    emit([...state, todo]);
  }
}
