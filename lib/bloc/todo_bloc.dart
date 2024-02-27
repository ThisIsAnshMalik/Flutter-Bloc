import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learning/model/todo_model.dart';

class TodoBloc extends Bloc<TodoAdded, List<TodoModel>> {
  TodoBloc() : super([]) {
    on<TodoAdded>((
      TodoAdded event,
      Emitter<List<TodoModel>> emit,
    ) {
      if (event.title.isEmpty) {
        addError('title cannot be empty!');
        return;
      }
      final todo = TodoModel(name: event.title, createdAt: DateTime.now());
      emit([...state, todo]);
    });
  }
}

class TodoAdded {
  final String title;

  TodoAdded({required this.title});
}
