import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learning/model/todo_model.dart';

class TodoBloc extends Bloc<TodoAdded, List<TodoModel>> {
  TodoBloc() : super([]) {
    on<TodoAdded>((event, emit) {
      emit([...state]);
    });
  }
}

class TodoAdded {
  TodoAdded({required this.title});
  String title;

  final todo = TodoModel(name: "title", createdAt: DateTime.now());
}
