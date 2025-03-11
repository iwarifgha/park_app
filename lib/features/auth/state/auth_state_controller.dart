import 'package:get/get.dart';

import '../../../core/services/api/auth_service.dart';
import '../../browse_parking/views/browse_parking_view.dart';
import '../views/login_view.dart';

class AuthStateController extends GetxController {
  final AuthService _authService = AuthService();

  var isLoading = false.obs;

  Future<void> signUp(String email, String password) async {
    isLoading.value = true;
    bool success = await _authService.signUp(email, password);
    isLoading.value = false;

    if (success) {
      Get.snackbar("Success", "Account created successfully!");
    } else {
      Get.snackbar("Error", "Sign-up failed.");
    }
  }

  Future<void> signIn(String email, String password) async {
    isLoading.value = true;
    bool success = await _authService.signIn(email, password);
    isLoading.value = false;

    if (success) {
      Get.offAllNamed(BrowseParkingView.name);
    } else {
      Get.snackbar("Error", "Sign-in failed.");
    }
  }

  Future<void> signOut() async {
    await _authService.signOut();
    Get.offAllNamed(LoginView.name);
  }
}
