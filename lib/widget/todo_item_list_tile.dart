import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/todo_provider.dart';

class TodoItemListTile extends ConsumerWidget {
  const TodoItemListTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todo = ref.watch(todoItemProvider);

    final id = todo.id;
    final desc = todo.desc;

    return ListTile(
      leading: Text(
        desc,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      trailing: IconButton(
        onPressed: () => ref.read(todoProvider.notifier).deleteTodo(
              id: id,
            ),
        icon: const Icon(
          Icons.delete,
          color: Colors.red,
        ),
      ),
    );
  }
}
