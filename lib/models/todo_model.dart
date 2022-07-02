import 'package:equatable/equatable.dart';

class ToDo extends Equatable {
  final String title;
  bool isDone;
  bool isDeleted;

  ToDo({required this.title, this.isDeleted = false, this.isDone = false});

  ToDo copyWith({String? title, bool? isDone, bool? isDeleted}) => ToDo(
    title: title ?? this.title,
    isDone: isDone ?? this.isDone,
    isDeleted: isDeleted ?? this.isDeleted,
  );

  Map<String, dynamic> toMap() => {
        'title': title,
        'isDone': isDone,
        'isDeleted': isDeleted,
      };

  factory ToDo.fromMap(Map<String, dynamic> map) => ToDo(
        title: map['title'] ?? '',
        isDone: map['isDone'],
        isDeleted: map['isDeleted'],
      );

  @override
  List<Object?> get props => [title, isDone, isDeleted];
}
