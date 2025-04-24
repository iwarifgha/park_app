import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:park_app/features/booking/state/booking_state_controller.dart';

class BookingView extends StatelessWidget {
  static const name = '/booking';
  BookingView({super.key});

  final BookingStateController _bookingController =
      Get.find<BookingStateController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Bookings")),
      body: Obx(() {
        if (_bookingController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (_bookingController.userBookings.isEmpty) {
          return Center(child: Text("No bookings yet."));
        }

        return ListView.builder(
          itemCount: _bookingController.userBookings.length,
          itemBuilder: (context, index) {
            final booking = _bookingController.userBookings[index];
            return ListTile(
              title: Text("Price: \$${booking.price} - ${booking.status}"),
              subtitle: Text(
                  "${booking.startTime.hour}:${booking.startTime.minute} - ${booking.endTime.hour}:${booking.endTime.minute}"),
            );
          },
        );
      }),
    );
  }
}
