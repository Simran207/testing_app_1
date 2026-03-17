// To parse this JSON data, do
//
//     final getuserdetailsresponse = getuserdetailsresponseFromJson(jsonString);

import 'dart:convert';

List<Getuserdetailsresponse> getuserdetailsresponseFromJson(String str) => List<Getuserdetailsresponse>.from(json.decode(str).map((x) => Getuserdetailsresponse.fromJson(x)));

String getuserdetailsresponseToJson(List<Getuserdetailsresponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Getuserdetailsresponse {
    String response;
    String responsecode;
    int id;
    String fname;
    String mname;
    String lname;
    String gender;
    String city;
    String state;
    String street1;
    String street2;
    String email;
    int pincode;
    String contactNo;
    String whatsappNo;
    DateTime date;
    int role;
    DateTime infoUpdated;
    DateTime dateCreated;
    DateTime dateModified;

    Getuserdetailsresponse({
        required this.response,
        required this.responsecode,
        required this.id,
        required this.fname,
        required this.mname,
        required this.lname,
        required this.gender,
        required this.city,
        required this.state,
        required this.street1,
        required this.street2,
        required this.email,
        required this.pincode,
        required this.contactNo,
        required this.whatsappNo,
        required this.date,
        required this.role,
        required this.infoUpdated,
        required this.dateCreated,
        required this.dateModified,
    });

    factory Getuserdetailsresponse.fromJson(Map<String, dynamic> json) => Getuserdetailsresponse(
        response: json["response"],
        responsecode: json["responsecode"],
        id: json["id"],
        fname: json["fname"],
        mname: json["mname"],
        lname: json["lname"],
        gender: json["gender"],
        city: json["city"],
        state: json["state"],
        street1: json["street1"],
        street2: json["street2"],
        email: json["email"],
        pincode: json["pincode"],
        contactNo: json["contactNo"],
        whatsappNo: json["whatsappNo"],
        date: DateTime.parse(json["date"]),
        role: json["role"],
        infoUpdated: DateTime.parse(json["infoUpdated"]),
        dateCreated: DateTime.parse(json["dateCreated"]),
        dateModified: DateTime.parse(json["dateModified"]),
    );

    Map<String, dynamic> toJson() => {
        "response": response,
        "responsecode": responsecode,
        "id": id,
        "fname": fname,
        "mname": mname,
        "lname": lname,
        "gender": gender,
        "city": city,
        "state": state,
        "street1": street1,
        "street2": street2,
        "email": email,
        "pincode": pincode,
        "contactNo": contactNo,
        "whatsappNo": whatsappNo,
        "date": date.toIso8601String(),
        "role": role,
        "infoUpdated": infoUpdated.toIso8601String(),
        "dateCreated": dateCreated.toIso8601String(),
        "dateModified": dateModified.toIso8601String(),
    };
}
