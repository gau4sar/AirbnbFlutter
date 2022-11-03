import '../data/network/BaseApiService.dart';
import '../res/AppUrl.dart';
import '../utils/utils.dart';

class AirbnbListingRepository {
  BaseApiService apiService;

  AirbnbListingRepository({required this.apiService});

  Future<String> getAirbnbListing() async {
    try {
      //call airbnb listing
      return "lists";
    } catch (e) {
      rethrow;
    }
  }
}
