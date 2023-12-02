import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel {
  UserModel({
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.gender,
  });

  @HiveField(0)
  String? firstName;

  @HiveField(1)
  String? lastName;

  @HiveField(2)
  String? phoneNumber;

  @HiveField(3)
  String? gender;

  UserModel copyWith({
    String? newFirstName,
    String? newLastName,
    String? newPhoneNumber,
    String? newGender,
  }) {
    return UserModel(
      firstName: newFirstName ?? firstName,
      lastName: newLastName?? lastName,
      gender: newGender?? gender,
      phoneNumber: newPhoneNumber?? phoneNumber,
    );
  }
}
