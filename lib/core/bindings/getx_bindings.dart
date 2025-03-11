import 'package:get/get.dart';
import 'package:park_app/features/auth/state/auth_state_controller.dart';
import 'package:park_app/features/booking/state/booking_state_controller.dart';
import 'package:park_app/features/browse_parking/state/browsing_state_controller.dart';
import 'package:park_app/features/listing/state/listing_state_controller.dart';

class GetBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BrowsingStateController>(() => BrowsingStateController());
    Get.lazyPut<BookingStateController>(() => BookingStateController());
    Get.lazyPut<ListingStateController>(() => ListingStateController());
    Get.lazyPut<AuthStateController>(() => AuthStateController());
  }
}