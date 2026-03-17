import 'dart:convert';

import 'package:testing_app_1/api/call/getuserdetails.dart';

class createjson {
  String createJsonForGetUserDetails(String? contactno, String fullname) {
    try {
      JsonEncoder encoder = JsonEncoder.withIndent('');
      Getuserdetails loginjsonCreation =
          Getuserdetails(contactno: contactno!, fullname: fullname!);
      var result = Getuserdetails.fromJson(loginjsonCreation.toJson());
      String str = encoder.convert(result);
      return str;
    } catch (e) {
      print(e.toString());
      return "";
    }
  }}