import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:legismate_mobile/models/district.dart';

class LegismateApi {
  static const _BASE_URL = "localhost:8888";

  Future<District> getDistricts(String location) async {
    final districtUrl = _BASE_URL + "/district?q=$location";
    final response = await http.get(districtUrl);
    final responseJson = json.decode(response.body);
    return District.fromJson(responseJson);
  }

}