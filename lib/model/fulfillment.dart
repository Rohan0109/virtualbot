// To parse this JSON data, do
//
//     final fulfillment = fulfillmentFromJson(jsonString);

import 'dart:convert';

Fulfillment fulfillmentFromJson(String str) => Fulfillment.fromJson(json.decode(str));

String fulfillmentToJson(Fulfillment data) => json.encode(data.toJson());

class Fulfillment {
  Fulfillment({
    required this.sessionInfo,
    required this.payload,
  });

  SessionInfo sessionInfo;
  Payload payload;

  factory Fulfillment.fromJson(Map<String, dynamic> json) => Fulfillment(
    sessionInfo: SessionInfo.fromJson(json["sessionInfo"]),
    payload: Payload.fromJson(json["payload"]),
  );

  Map<String, dynamic> toJson() => {
    "sessionInfo": sessionInfo.toJson(),
    "payload": payload.toJson(),
  };
}

class Payload {
  Payload({
    required this.botId,
    required this.applicationId,
    required this.env,
    required this.email,
    required this.auth,
    required this.pkey,
    required this.messageSource,
  });

  String botId;
  String applicationId;
  String env;
  String email;
  bool auth;
  String pkey;
  String messageSource;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
    botId: json["botId"],
    applicationId: json["applicationId"],
    env: json["env"],
    email: json["email"],
    auth: json["auth"],
    pkey: json["pkey"],
    messageSource: json["messageSource"],
  );

  Map<String, dynamic> toJson() => {
    "botId": botId,
    "applicationId": applicationId,
    "env": env,
    "email": email,
    "auth": auth,
    "pkey": pkey,
    "messageSource": messageSource,
  };
}

class SessionInfo {
  SessionInfo({
    required this.session,
    required this.parameters,
  });

  String session;
  Parameters parameters;

  factory SessionInfo.fromJson(Map<String, dynamic> json) => SessionInfo(
    session: json["session"],
    parameters: Parameters.fromJson(json["parameters"]),
  );

  Map<String, dynamic> toJson() => {
    "session": session,
    "parameters": parameters.toJson(),
  };
}

class Parameters {
  Parameters({
    required this.apiMethods,
  });

  List<String> apiMethods;

  factory Parameters.fromJson(Map<String, dynamic> json) => Parameters(
    apiMethods: List<String>.from(json["api-methods"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "api-methods": List<dynamic>.from(apiMethods.map((x) => x)),
  };
}
