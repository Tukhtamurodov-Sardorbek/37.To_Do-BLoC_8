import 'package:equatable/equatable.dart';

class ToDo extends Equatable {
  final String id;
  final String title;
  final String description;
  final String createdTime;
  final bool isDone;
  final bool isDeleted;
  final bool isFavorite;

  const ToDo({
    required this.id,
    required this.title,
    required this.description,
    required this.createdTime,
    this.isDeleted = false,
    this.isDone = false,
    this.isFavorite = false,
  });

  ToDo copyWith({
    String? id,
    String? title,
    String? description,
    String? createdTime,
    bool? isDone,
    bool? isDeleted,
    bool? isFavorite,
  }) =>
      ToDo(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        createdTime: createdTime ?? this.createdTime,
        isDone: isDone ?? this.isDone,
        isDeleted: isDeleted ?? this.isDeleted,
        isFavorite: isFavorite ?? this.isFavorite,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'description': description,
        'createdTime': createdTime,
        'isDone': isDone,
        'isDeleted': isDeleted,
        'isFavorite': isFavorite,
      };

  factory ToDo.fromMap(Map<String, dynamic> map) => ToDo(
        id: map['id'] ?? '',
        title: map['title'] ?? '',
        description: map['description'] ?? '',
        createdTime: map['createdTime'] ?? '',
        isDone: map['isDone'],
        isDeleted: map['isDeleted'],
        isFavorite: map['isFavorite'],
      );

  @override
  List<Object?> get props =>
      [id, title, description, createdTime, isDone, isDeleted, isFavorite];
}
