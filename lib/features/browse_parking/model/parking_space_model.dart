import 'package:hive/hive.dart';

part 'parking_space_model.g.dart';

@HiveType(typeId: 1)
class ParkingSpace extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String ownerId;

  @HiveField(2)
  String name;

  @HiveField(3)
  String description;

  @HiveField(4)
  String imageUrl;

  @HiveField(5)
  double latitude;

  @HiveField(6)
  double longitude;

  @HiveField(7)
  double price;

  @HiveField(8)
  bool isAvailable;

  @HiveField(9)
  DateTime createdAt;

  ParkingSpace({
    required this.id,
    required this.ownerId,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.latitude,
    required this.longitude,
    required this.price,
    this.isAvailable = true,
    required this.createdAt,
  });

  factory ParkingSpace.fromJson(Map<String, dynamic> json) => ParkingSpace(
    id: json['id'],
    ownerId: json['owner_id'],
    name: json['name'],
    description: json['description'] ?? "",
    imageUrl: json['image_url'] ?? "",
    latitude: json['latitude'],
    longitude: json['longitude'],
    price: json['price'].toDouble(),
    isAvailable: json['is_available'],
    createdAt: DateTime.parse(json['created_at']),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'owner_id': ownerId,
    'name': name,
    'description': description,
    'image_url': imageUrl,
    'latitude': latitude,
    'longitude': longitude,
    'price': price,
    'is_available': isAvailable,
    'created_at': createdAt.toIso8601String(),
  };
}
