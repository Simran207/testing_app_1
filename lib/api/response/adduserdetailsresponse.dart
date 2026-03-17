// To parse this JSON data, do
//
//     final adduserdetailsresponse = adduserdetailsresponseFromJson(jsonString);

import 'dart:convert';

List<Adduserdetailsresponse> adduserdetailsresponseFromJson(String str) => List<Adduserdetailsresponse>.from(json.decode(str).map((x) => Adduserdetailsresponse.fromJson(x)));

String adduserdetailsresponseToJson(List<Adduserdetailsresponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Adduserdetailsresponse {
    String response;
    String responsecode;

    Adduserdetailsresponse({
        required this.response,
        required this.responsecode,
    });

    factory Adduserdetailsresponse.fromJson(Map<String, dynamic> json) => Adduserdetailsresponse(
        response: json["response"],
        responsecode: json["responsecode"],
    );

    Map<String, dynamic> toJson() => {
        "response": response,
        "responsecode": responsecode,
    };
}
