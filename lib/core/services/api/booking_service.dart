import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../features/booking/model/booking_model.dart';
import '../local/local_storage_service.dart';

class BookingService {
  final supabase = Supabase.instance.client;
  final LocalStorageService _localStorageService = LocalStorageService();

  Future<bool> bookParkingSpace(Booking booking) async {
    try {
      // Save booking to Supabase
      await supabase.from('bookings').insert({
        'id': booking.id,
        'user_id': booking.userId,
        'parking_space_id': booking.parkingSpaceId,
        'start_time': booking.startTime.toIso8601String(),
        'end_time': booking.endTime.toIso8601String(),
        'price': booking.price,
        'status': booking.status,
      });

      // Cache the booking
       //_localStorageService.saveData('user_bookings', booking);
      List<Booking> cachedBookings =  _localStorageService.getData('user_bookings');
      cachedBookings.add(booking);
      return true;
    } catch (e) {
      print("Error booking parking space: $e");
      return false;
    }
  }

  Future<List<Booking>> fetchUserBookings(String userId) async {
    var cachedData = _localStorageService.getData('user_bookings');
    if (cachedData != null) {
      return cachedData as List<Booking>;
    }

    try {
      final response = await supabase
          .from('bookings')
          .select()
          .eq('user_id', userId);

      List<Booking> bookings = response.map((data) =>  Booking.fromJson(data)).toList();

      // Cache the bookings
      _localStorageService.saveData('user_bookings', bookings);

      return bookings;
    } catch (e) {
      print("Error fetching bookings: $e");
      return [];
    }
  }
}
