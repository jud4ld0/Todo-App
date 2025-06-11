import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  final String id;
  
  @HiveField(1)
  String title;
  
  @HiveField(2)
  String subtitle;
  
  @HiveField(3)
  DateTime createdAt;
  
  @HiveField(4)
  DateTime? dueDate;
  
  @HiveField(5)
  bool isCompleted;

  Task({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.createdAt,
    this.dueDate,
    this.isCompleted = false,
  });

  factory Task.create({
    required String title,
    required String subtitle,
    DateTime? createdAtDate,
  }) {
    return Task(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      subtitle: subtitle,
      createdAt: DateTime.now(),
      dueDate: createdAtDate,
      isCompleted: false,
    );
  }
}