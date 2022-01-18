import 'package:http/http.dart' as http;

class HttpServices {
  static Future getDetails(String? placeId) async {
    String placeUrl = 'https://maps.googleapis.com/maps/api/place';
    try {
      //     https://maps.googleapis.com/maps/api/place/details/json
      // ?fields=name%2Crating%2Cformatted_phone_number
      // &place_id=ChIJN1t_tDeuEmsRUsoyG83frY4
      // &key=YOUR_API_KEY  //for reference with fields

      if (placeId == null) {
        print("TRYAGAIN!!!!");
      } else {
        final response = (await http.get(Uri.parse(
                '$placeUrl/details/json?place_id=$placeId&key=AIzaSyCWQrVaDnzwwyauY9Foy_Ur6Y43u0Zgw70')))
            .body;

        print(response);
      }
    } catch (e) {
      return e.toString();
    }
  }
}
