class Todo {
  final String id;
  String title;
  String? description;
  bool done;
  DateTime createdAt;
  DateTime? completedAt;
  Priority priority;

  Todo({
    required this.id,
    required this.title,
    this.description,
    this.done = false,
    DateTime? createdAt,
    this.completedAt,
    this.priority = Priority.medium,
  }) : createdAt = createdAt ?? DateTime.now();

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      done: json['done'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      completedAt: json['completedAt'] != null
          ? DateTime.parse(json['completedAt'] as String)
          : null,
      priority: Priority.values.firstWhere(
        (e) => e.toString() == json['priority'],
        orElse: () => Priority.medium,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'done': done,
      'createdAt': createdAt.toIso8601String(),
      'completedAt': completedAt?.toIso8601String(),
      'priority': priority.toString(),
    };
  }

  Todo copyWith({
    String? title,
    String? description,
    bool? done,
    DateTime? completedAt,
    Priority? priority,
  }) {
    return Todo(
      id: this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      done: done ?? this.done,
      createdAt: this.createdAt,
      completedAt: completedAt ?? this.completedAt,
      priority: priority ?? this.priority,
    );
  }
}

enum Priority { low, medium, high }
