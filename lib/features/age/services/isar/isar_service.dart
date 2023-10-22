import 'package:isar/isar.dart';
import 'package:streage/features/age/domain/models/age_model.dart';

class IsarService {
  IsarService();

  Future<AgeModel?> getDBStatus() async {
    return null;
  }

  Future<void> deleteAge(Id id) async {}

  Future<void> createAge(AgeModel age) async {}

  Future<List<AgeModel>> getAge() async {
    return [];
  }

  Future<void> updateAge(AgeModel age) async {}
}
