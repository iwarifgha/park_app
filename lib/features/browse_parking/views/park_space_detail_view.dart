import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:park_app/features/booking/state/booking_state_controller.dart';

import '../../booking/model/booking_model.dart';

class ParkingDetailView extends StatelessWidget {
  final String parkingSpaceId;
  final String parkingSpaceName;
  final double price;

  ParkingDetailView({
    super.key,
    required this.parkingSpaceId,
    required this.parkingSpaceName,
    required this.price,
  });

  final BookingStateController _bookingController =
      Get.find<BookingStateController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(parkingSpaceName)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Parking Space: $parkingSpaceName",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text("Price: \$${price.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 18, color: Colors.green)),
            SizedBox(height: 20),
            Obx(() {
              return _bookingController.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: () async {
                        var booking = Booking(
                          id: '',
                          userId: "user_123", // Replace with actual user ID
                          parkingSpaceId: parkingSpaceId,
                          startTime: DateTime.now(),
                          endTime: DateTime.now().add(Duration(hours: 2)),
                          price: price,
                          status: "Pending",
                          createdAt: DateTime.now(),
                        );

                        bool success =
                            await _bookingController.bookParking(booking);
                        if (success) {
                          Get.snackbar(
                              "Success", "Parking booked successfully!",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.green,
                              colorText: Colors.white);
                        } else {
                          Get.snackbar("Error", "Booking failed!",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.red,
                              colorText: Colors.white);
                        }
                      },
                      child: Text("Book Now"),
                    );
            }),
          ],
        ),
      ),
    );
  }
}
