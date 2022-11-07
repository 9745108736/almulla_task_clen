import 'package:hive/hive.dart';

part 'todo.g.dart';

@HiveType(typeId: 1)
class Books {
  Books({this.id, this.todo_task_name, this.todo_date});

  @HiveField(0)
  int? id;

  @HiveField(1)
  String? todo_task_name;

  @HiveField(2)
  String? todo_date;
}
