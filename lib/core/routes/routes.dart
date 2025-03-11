import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../features/auth/views/login_view.dart';
import '../../features/booking/views/booking_view.dart';
import '../../features/browse_parking/views/browse_parking_view.dart';
import '../../features/listing/views/listing_view.dart';



class AppPages {
  static final routes = [
    GetPage(name: BrowseParkingView.name, page: () => BrowseParkingView()),
    GetPage(name: BookingView.name, page: () => BookingView()),
    GetPage(name: ListingView.name, page: () => ListingView()),
    GetPage(name: LoginView.name, page: () => LoginView()),
  ];
}
