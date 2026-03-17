// To parse this JSON data, do
//
//     final getuserdetails = getuserdetailsFromJson(jsonString);

import 'dart:convert';

Getuserdetails getuserdetailsFromJson(String str) => Getuserdetails.fromJson(json.decode(str));

String getuserdetailsToJson(Getuserdetails data) => json.encode(data.toJson());

class Getuserdetails {
    String contactno;
    String fullname;

    Getuserdetails({
        required this.contactno,
        required this.fullname,
    });

    factory Getuserdetails.fromJson(Map<String, dynamic> json) => Getuserdetails(
        contactno: json["contactno"],
        fullname: json["fullname"],
    );

    Map<String, dynamic> toJson() => {
        "contactno": contactno,
        "fullname": fullname,
    };
}
