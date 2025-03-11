import 'package:park_app/core/services/local/local_storage_service.dart';
import 'package:park_app/features/browse_parking/model/parking_space_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ParkingRepository {
  final supabase = Supabase.instance.client;
  final LocalStorageService _hiveService = LocalStorageService();

  Future<List<ParkingSpace>> fetchParkingSpaces() async {
    // Check cache first
    var cachedData = _hiveService.getData('cached_parking_spaces');
    if (cachedData != null) {
      return cachedData as List<ParkingSpace>;
    }


    try {
      final response = await supabase.from('parking_spaces').select();
      _hiveService.saveData('cached_parking_spaces', response);
      return response.map((val) => ParkingSpace.fromJson(val)).toList();
    } catch (e) {
      print("Error fetching parking spaces: $e");
      return [];
    }
  }
}
