import 'package:hive/hive.dart';

part 'add_nopt.g.dart';

@HiveType(typeId: 1)
class Notepad {
  Notepad({required this.note});

  @HiveField(0)
  String note;
}
