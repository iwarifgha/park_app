import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String fullName;

  @HiveField(2)
  String email;

  @HiveField(3)
  String phone;

  @HiveField(4)
  DateTime createdAt;

  UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    this.phone = "",
    required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'],
    fullName: json['full_name'],
    email: json['email'],
    phone: json['phone'] ?? "",
    createdAt: DateTime.parse(json['created_at']),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'full_name': fullName,
    'email': email,
    'phone': phone,
    'created_at': createdAt.toIso8601String(),
  };
}
