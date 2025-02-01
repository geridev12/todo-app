import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/todo_provider.dart';

class TodoPage extends ConsumerStatefulWidget {
  const TodoPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TodoPageState();
}

class _TodoPageState extends ConsumerState<TodoPage> {
  late final TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  hintText: 'Add todo',
                ),
                onTapOutside: (_) => FocusScope.of(context).unfocus(),
                onSubmitted: (String desc) {
                  ref.read(todoProvider.notifier).addTodo(desc: desc);
                  _descriptionController.clear();
                  FocusScope.of(context).unfocus();
                },
              ),
              Flexible(
                child: Consumer(
                  builder: (context, ref, child) {
                    final todos = ref.watch(todoProvider);

                    return ListView.separated(
                      itemCount: todos.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 15),
                      itemBuilder: (context, index) {
                        final todo = todos[index];

                        final id = todo.id;
                        final desc = todo.desc;

                        return ListTile(
                          key: ValueKey<String>(id),
                          leading: Text(
                            desc,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          trailing: IconButton(
                            onPressed: () =>
                                ref.read(todoProvider.notifier).deleteTodo(
                                      id: id,
                                    ),
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
