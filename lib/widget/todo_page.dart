import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'todo_view.dart';
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
    ref.listen(
      todoProvider,
      (previous, next) {},
    );

    return const TodoView();
  }
}
