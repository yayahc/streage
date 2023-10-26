import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:streage/features/age/domain/models/age_model.dart';

class IsarService {
  late Future<Isar> db;
  IsarService() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([AgeModelSchema], directory: dir.path);
    } else {
      return Future.value(Isar.getInstance());
    }
  }

  Future<Isar?> getDBStatus() async {
    final isar = await db;
    return isar;
  }

  Future<void> deleteAge(Id id) async {
    final isar = await db;
    isar.ageModels.delete(id);
  }

  Future<void> createAge(AgeModel age) async {
    final isar = await db;
    isar.writeTxn(() => isar.ageModels.put(age));
  }

  Future<AgeModel?> getAge(Id id) async {
    final isar = await db;
    return isar.ageModels.get(id);
  }

  Future<void> updateAge(AgeModel age) async {
    final isar = await db;
    final oldAge = await getAge(age.id!);
    oldAge!.years = age.years;
    oldAge.months = age.months;
    oldAge.days = age.days;
    oldAge.hours = age.hours;
    oldAge.minutes = age.minutes;
    oldAge.seconds = age.seconds;
    oldAge.milliseconds = age.milliseconds;
    oldAge.microseconds = age.microseconds;
    isar.writeTxn(() => isar.ageModels.put(age));
  }
}
