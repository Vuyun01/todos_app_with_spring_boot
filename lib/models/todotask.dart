// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ToDoTask {
  int? id;
  String title;
  String? subtitle;
  String? description;
  DateTime createdAt;
  bool completed;
  ToDoTask({
    this.id,
    required this.title,
    this.subtitle,
    this.description,
    required this.createdAt,
    required this.completed,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'description': description,
      'createdAt': createdAt.toIso8601String(),
      'completed': completed,
    };
  }

  factory ToDoTask.fromMap(Map<String, dynamic> map) {
    return ToDoTask(
      id: map['id'] as int,
      title: map['title'] as String,
      subtitle: map['subtitle'] ?? "",
      description: map['description'] ?? "",
      createdAt: DateTime.parse(map['createdAt']),
      completed: map['completed'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ToDoTask.fromJson(String source) =>
      ToDoTask.fromMap(json.decode(source) as Map<String, dynamic>);
}
