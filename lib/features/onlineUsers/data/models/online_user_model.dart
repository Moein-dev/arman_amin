import 'package:arman_amin/features/onlineUsers/domain/entities/online_user_entity.dart';

class OnlineUser extends OnlineUserEntity {
  const OnlineUser({
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? street,
    String? state,
    String? country,
    double? longitude,
    int? id,
    String? gender,
    DateTime? dateOfBirth,
    String? job,
    String? city,
    String? zipcode,
    double? latitude,
    String? profilePicture,
  }) : super(
          firstName: firstName,
          lastName: lastName,
          email: email,
          phone: phone,
          street: street,
          state: state,
          country: country,
          longitude: longitude,
          id: id,
          gender: gender,
          dateOfBirth: dateOfBirth,
          job: job,
          city: city,
          zipcode: zipcode,
          latitude: latitude,
          profilePicture: profilePicture,
        );

  factory OnlineUser.fromJson(Map<String, dynamic> json) => OnlineUser(
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        phone: json["phone"],
        street: json["street"],
        state: json["state"],
        country: json["country"],
        longitude: json["longitude"]?.toDouble(),
        id: json["id"],
        gender: json["gender"],
        dateOfBirth: json["date_of_birth"] == null
            ? null
            : DateTime.parse(json["date_of_birth"]),
        job: json["job"],
        city: json["city"],
        zipcode: json["zipcode"],
        latitude: json["latitude"]?.toDouble(),
        profilePicture: json["profile_picture"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone": phone,
        "street": street,
        "state": state,
        "country": country,
        "longitude": longitude,
        "id": id,
        "gender": gender,
        "date_of_birth": dateOfBirth?.toIso8601String(),
        "job": job,
        "city": city,
        "zipcode": zipcode,
        "latitude": latitude,
        "profile_picture": profilePicture,
      };

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        email,
        phone,
        street,
        state,
        country,
        longitude,
        id,
        gender,
        dateOfBirth,
        job,
        city,
        zipcode,
        latitude,
        profilePicture,
      ];
}
