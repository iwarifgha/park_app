import 'package:hive/hive.dart';

import '../../features/auth/model/user_model.dart';
import '../../features/booking/model/booking_model.dart';
import '../../features/browse_parking/model/parking_space_model.dart';


void registerHiveAdapters() {
  // Register all adapters here
  Hive.registerAdapter(ParkingSpaceAdapter());  // Register adapter
  Hive.registerAdapter(UserModelAdapter());  // Register adapter
  Hive.registerAdapter(BookingAdapter());
}