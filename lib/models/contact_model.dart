
import 'package:hive/hive.dart';
part 'contact_model.g.dart';

@HiveType(typeId: 1)
class Contacts {
  @HiveField(0)
  String name;
  @HiveField(1)
  String number;

  Contacts({required this.name, required this.number});

  
}
