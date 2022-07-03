import 'package:equatable/equatable.dart';

class ToDo extends Equatable {
  final String id;
  final String title;
  final String description;
  final String createdTime;
  final bool isDone;
  final bool isDeleted;
  final bool isSaved;

  const ToDo({
    required this.id,
    required this.title,
    required this.description,
    required this.createdTime,
    this.isDeleted = false,
    this.isDone = false,
    this.isSaved = false,
  });

  ToDo copyWith({
    String? id,
    String? title,
    String? description,
    String? createdTime,
    bool? isDone,
    bool? isDeleted,
    bool? isSaved,
  }) =>
      ToDo(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        createdTime: createdTime ?? this.createdTime,
        isDone: isDone ?? this.isDone,
        isDeleted: isDeleted ?? this.isDeleted,
        isSaved: isSaved ?? this.isSaved,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'description': description,
        'createdTime': createdTime,
        'isDone': isDone,
        'isDeleted': isDeleted,
        'isSaved': isSaved,
      };

  factory ToDo.fromMap(Map<String, dynamic> map) => ToDo(
        id: map['id'] ?? '',
        title: map['title'] ?? '',
        description: map['description'] ?? '',
        createdTime: map['createdTime'] ?? '',
        isDone: map['isDone'],
        isDeleted: map['isDeleted'],
        isSaved: map['isSaved'],
      );

  @override
  List<Object?> get props =>
      [id, title, description, createdTime, isDone, isDeleted, isSaved];
}
