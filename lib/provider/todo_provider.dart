import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/todo.dart';

class TodoNotifier extends StateNotifier<List<Todo>> {
  TodoNotifier()
      : super(
          const <Todo>[],
        );

  void deleteTodo({
    required String id,
  }) {
    final newTodos = state
        .where(
          (Todo todo) => todo.id.compareTo(id) != 0,
        )
        .toList();

    state = [...newTodos];
  }

  void addTodo({
    required String desc,
  }) {
    final newTodo = Todo.add(desc: desc);

    state = [
      ...state,
      newTodo,
    ];
  }
}

final todoProvider = StateNotifierProvider<TodoNotifier, List<Todo>>(
  (ref) => TodoNotifier(),
);
