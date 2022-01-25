import 'dart:io';

class TodoModel {
  final String title;
  final String description;
  final File? imagePath;

  const TodoModel({
    required this.title,
    required this.description,
    required this.imagePath,
  });

  TodoModel copyWith({
    String? title,
    String? description,
    File? imagePath,
  }) {
    return TodoModel(
      title: title ?? this.title,
      description: description ?? this.description,
      imagePath: imagePath ?? this.imagePath,
    );
  }
}
