import 'package:equatable/equatable.dart';

class ToDo extends Equatable {
  final String id;
  final String title;
  final String description;
  bool isDone;
  bool isDeleted;

  ToDo(
      {required this.id,
      required this.title,
      required this.description,
      this.isDeleted = false,
      this.isDone = false});

  ToDo copyWith({
    String? id,
    String? title,
    String? description,
    bool? isDone,
    bool? isDeleted,
  }) =>
      ToDo(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        isDone: isDone ?? this.isDone,
        isDeleted: isDeleted ?? this.isDeleted,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'description': description,
        'isDone': isDone,
        'isDeleted': isDeleted,
      };

  factory ToDo.fromMap(Map<String, dynamic> map) => ToDo(
        id: map['id'] ?? '',
        title: map['title'] ?? '',
        description: map['description'] ?? '',
        isDone: map['isDone'],
        isDeleted: map['isDeleted'],
      );

  @override
  List<Object?> get props => [id, title, description, isDone, isDeleted];
}
