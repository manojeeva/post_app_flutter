import 'dart:io';

class PostModel {
  final String title;
  final String description;
  final File? imagePath;

  const PostModel({
    required this.title,
    required this.description,
    required this.imagePath,
  });

  PostModel copyWith({
    String? title,
    String? description,
    File? imagePath,
  }) {
    return PostModel(
      title: title ?? this.title,
      description: description ?? this.description,
      imagePath: imagePath ?? this.imagePath,
    );
  }
}
