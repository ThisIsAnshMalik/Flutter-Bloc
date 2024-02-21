import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_learning/models/todo_model.dart';

class TodoCubit extends Cubit<List<TodoModel>> {
  TodoCubit() : super([]);
}
