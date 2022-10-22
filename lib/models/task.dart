import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String title;
  bool? isDone;
  bool? isDeleted;
  Task({required this.title, this.isDeleted, this.isDone}) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }

  Task copyWith({
    String? title,
    bool? isDone,
    bool? isDeleted,
  }) {
    return Task(
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] ?? '',
      isDone: map['isDone'],
      isDeleted: map['isDeleted'],
    );
  }

  // static Task fromSnapshot(DocumentSnapshot snap) {
  //   return Task(snap.data['title'],snap.data['isDone'],snap.data['isCompleted'], snap.documentID);
  // }

  Map<String, Object> toDocument() {
    return {
      'title': title,
      'done': isDone!,
      'deleted': isDeleted!,
    };
  }

  @override
  List<Object?> get props => [title, isDeleted, isDone];
}
