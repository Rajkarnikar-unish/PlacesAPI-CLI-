import 'dart:io';

import 'package:google_place/google_place.dart';

import 'http_services.dart';

void main(List<String> arguments) {
  print('Enter a location: ');
  String? str = stdin.readLineSync();
  getPlace(str);
}

void getPlace(input) async {
  var googlePlace = GooglePlace('AIzaSyCWQrVaDnzwwyauY9Foy_Ur6Y43u0Zgw70');
  var result = (await googlePlace.autocomplete.get(input))!.predictions;
  // var result = await googlePlace.get(input);

  final Iterable<String?> placeId = result!.map((e) => e.placeId);
  print(placeId);
  HttpServices.getDetails(
      placeId.firstWhere((element) => element != null, orElse: () => null));
}
