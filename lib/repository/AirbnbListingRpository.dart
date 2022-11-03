import '../data/network/BaseApiService.dart';
import '../res/AppUrl.dart';
import '../utils/utils.dart';

class AirbnbListingRepository {
  BaseApiService apiService;

  AirbnbListingRepository({required this.apiService});

  Future<dynamic> getAirbnbListing() async {
    try {
      dynamic response = apiService.getGetApiResponse(AppUrl.baseUrl);

      //call airbnb listing
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
