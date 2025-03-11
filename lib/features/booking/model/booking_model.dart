import 'package:hive/hive.dart';

part 'booking_model.g.dart';

@HiveType(typeId: 2)
class Booking extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String userId;

  @HiveField(2)
  String parkingSpaceId;

  @HiveField(3)
  DateTime startTime;

  @HiveField(4)
  DateTime endTime;

  @HiveField(5)
  double price;

  @HiveField(6)
  String status; // Pending, Confirmed, Cancelled

  @HiveField(7)
  DateTime createdAt;

  Booking({
    required this.id,
    required this.userId,
    required this.parkingSpaceId,
    required this.startTime,
    required this.endTime,
    required this.price,
    this.status = 'Pending',
    required this.createdAt,
  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
    id: json['id'],
    userId: json['user_id'],
    parkingSpaceId: json['parking_space_id'],
    startTime: DateTime.parse(json['start_time']),
    endTime: DateTime.parse(json['end_time']),
    price: json['price'].toDouble(),
    status: json['status'],
    createdAt: DateTime.parse(json['created_at']),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'user_id': userId,
    'parking_space_id': parkingSpaceId,
    'start_time': startTime.toIso8601String(),
    'end_time': endTime.toIso8601String(),
    'price': price,
    'status': status,
    'created_at': createdAt.toIso8601String(),
  };
}
