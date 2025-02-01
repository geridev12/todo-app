import 'package:uuid/uuid.dart';

class Todo {
  const Todo({
    required this.id,
    required this.desc,
    required this.isCompleted,
  });

  const Todo.initial()
      : this(
          id: '',
          desc: '',
          isCompleted: false,
        );

  factory Todo.add({required String desc}) => Todo(
        id: const Uuid().v4(),
        desc: desc,
        isCompleted: false,
      );

  final String id;
  final String desc;
  final bool isCompleted;

  Todo copyWith({
    String? id,
    String? desc,
    bool? isCompleted,
  }) {
    return Todo(
      id: id ?? this.id,
      desc: desc ?? this.desc,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  String toString() => 'Todo(id: $id, desc: $desc, isCompleted: $isCompleted)';

  @override
  bool operator ==(covariant Todo other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.desc == desc &&
        other.isCompleted == isCompleted;
  }

  @override
  int get hashCode => id.hashCode ^ desc.hashCode ^ isCompleted.hashCode;
}
