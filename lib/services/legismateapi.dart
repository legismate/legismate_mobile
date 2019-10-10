import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:legismate_mobile/models/district.dart';
import 'package:legismate_mobile/models/bill.dart';

class LegismateApi {
  //todo: this pulls from localhost, change to use config so can pull from tf site
  static const _BASE_URL = "http://127.0.0.1:3000";

  Future<District> getDistricts(String location) async {
    final districtUrl = _BASE_URL + "/district?q=$location";
    final response = await http.get(districtUrl);
    final responseJson = json.decode(response.body);
    return District.fromJson(responseJson);
  }

  Future<List<Bill>> getUpcomingBills() async {
    final upcomingBillsUrl = _BASE_URL + "/bills?level=CITY&levelValue=seattle";
    final response = await http.get(upcomingBillsUrl);
    Iterable list = json.decode(response.body);
    List<Bill> bills = list.map((m) => Bill.fromJson(m)).toList();
    return bills;
  }

}