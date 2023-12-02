import 'package:equatable/equatable.dart';

abstract class OnlineUserEntity extends Equatable {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? street;
  final String? state;
  final String? country;
  final double? longitude;
  final int? id;
  final String? gender;
  final DateTime? dateOfBirth;
  final String? job;
  final String? city;
  final String? zipcode;
  final double? latitude;
  final String? profilePicture;

  const OnlineUserEntity({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.street,
    this.state,
    this.country,
    this.longitude,
    this.id,
    this.gender,
    this.dateOfBirth,
    this.job,
    this.city,
    this.zipcode,
    this.latitude,
    this.profilePicture,
  });
}
