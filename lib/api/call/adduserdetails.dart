// To parse this JSON data, do
//
//     final adduserdetails = adduserdetailsFromJson(jsonString);

import 'dart:convert';

Adduserdetails adduserdetailsFromJson(String str) => Adduserdetails.fromJson(json.decode(str));

String adduserdetailsToJson(Adduserdetails data) => json.encode(data.toJson());

class Adduserdetails {
    int id;
    String fname;
    String mname;
    String lname;
    String gender;
    String city;
    String state;
    int pincode;
    String contactNo;
    DateTime date;
    int role;

    Adduserdetails({
        required this.id,
        required this.fname,
        required this.mname,
        required this.lname,
        required this.gender,
        required this.city,
        required this.state,
        required this.pincode,
        required this.contactNo,
        required this.date,
        required this.role,
    });

    factory Adduserdetails.fromJson(Map<String, dynamic> json) => Adduserdetails(
        id: json["id"],
        fname: json["fname"],
        mname: json["mname"],
        lname: json["lname"],
        gender: json["gender"],
        city: json["city"],
        state: json["state"],
        pincode: json["pincode"],
        contactNo: json["contactNo"],
        date: DateTime.parse(json["date"]),
        role: json["role"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fname": fname,
        "mname": mname,
        "lname": lname,
        "gender": gender,
        "city": city,
        "state": state,
        "pincode": pincode,
        "contactNo": contactNo,
        "date": date.toIso8601String(),
        "role": role,
    };
}
