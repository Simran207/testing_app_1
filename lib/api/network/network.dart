import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../response/getuserdetailsresponse.dart';

class NetworkCall {
  Future<List<Object?>?> postMethod(
      int requestCode, String url, String body, BuildContext context) async {
    
    var response = await http.post(Uri.parse(url), body: body);
  
    try {
      if (response.statusCode == 200) {
        String ResponseString = response.body;

        String str = "[" + ResponseString + "]";
        log("***** URL : $url + body : $body + Response : $str *****");

        switch (requestCode) {
          case 1:
            final loginresponse = getuserdetailsresponseFromJson(str);
            return loginresponse;
         
      } }else if (response.statusCode == 400) {
        switch (requestCode) {
          case 1:
            break;
          case 2:
            break;
        }
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      // SnackBarDesign("Something went wrong", context);
    }
    return null;
  }}
  
