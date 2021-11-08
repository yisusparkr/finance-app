import 'dart:convert';

RfcResponse rfcResponseFromJson(String str) => RfcResponse.fromJson(json.decode(str));

String rfcResponseToJson(RfcResponse data) => json.encode(data.toJson());

class RfcResponse {
  RfcResponse({
    this.isValid,
    this.isRegistered,
    this.rfc,
    this.type,
  });

  bool? isValid;
  bool? isRegistered;
  String? rfc;
  String? type;

  factory RfcResponse.fromJson(Map<String, dynamic> json) => RfcResponse(
    isValid: json["isValid"],
    isRegistered: json["isRegistered"],
    rfc: json["rfc"],
    type: json["type"],
  );
  
  Map<String, dynamic> toJson() => {
    "isValid": isValid,
    "isRegistered": isRegistered,
    "rfc": rfc,
    "type": type,
  };
}
