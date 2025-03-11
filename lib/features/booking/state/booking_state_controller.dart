import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:park_app/core/services/api/booking_service.dart';

import '../model/booking_model.dart';




class BookingStateController extends GetxController {
  final BookingService _bookingRepository = BookingService();
  var userBookings = <Booking>[].obs;
  var isLoading = false.obs;

  Future<void> fetchBookings(String userId) async {
    isLoading.value = true;
    userBookings.value = await _bookingRepository.fetchUserBookings(userId);
    isLoading.value = false;
  }

  Future<bool> bookParking(Booking booking) async {
    isLoading.value = true;
    bool success = await _bookingRepository.bookParkingSpace(booking);
    if (success) {
      userBookings.add(booking); // Update UI
    }
    isLoading.value = false;
    return success;
  }
}
