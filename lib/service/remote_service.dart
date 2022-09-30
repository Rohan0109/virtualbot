
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:webview/model/fulfillment.dart';


import '../model/data.dart';
import '../model/datadog.dart';
import '../model/entity.dart';






var Environment= "null";
var Pkey = "null";
  class RemoteService {

bool login(environment,pkey){

//Environment = fulfillment();
Pkey = pkey;
log(Environment);
log(Pkey);
return true;

}

  Future<List<Entity>?> getEntity() async {
    var client = http.Client();
 //  var uri = Uri.parse('https://dev-rohanmurali.gateway.apiplatform.io/v1/rohanshop');
  var uri = Uri.parse(
    // 'https://services.apiplatform.io/v1/admin/${Environment}/${Environment}/entities');
  'https://services.apiplatform.io/v1/admin/dev-rohanmurali/dev-rohanmurali/entities');
//  log(uri.toString());
  var response = await client.get(uri,headers: {"pkey": "3fdabdac7be3f1483fd675c4334d4a72"});
 // var response = await client.get(
 //uri, headers: {"pkey": "${Pkey}"});
  if (response.statusCode == 200) {
  var json = response.body;


  return entityFromJson(json);
  }
  }

  Future<List<Data>?> getData() async {
  var client = http.Client();
  var uri = Uri.parse(
  'https://dev-rohanmurali.gateway.apiplatform.io/v1/rohanshop');
  //var uri = Uri.parse('https://services.apiplatform.io/v1/admin/dev-rohanmurali/dev-rohanmurali/entities');
  // var response = await client.get(uri,headers: {"pkey": "3fdabdac7be3f1483fd675c4334d4a72"});
  var response = await client.get(
  uri, headers: {
  "pkey": "3fdabdac7be3f1483fd675c4334d4a72",
  "apikey": "a9WnwaZF0rrMy2T7iUcAnM9cEyTc7jTy"
  });
  if (response.statusCode == 200) {
  var json = response.body;
  return dataFromJson(json);
  }
  }

  Future<Charts?> getrequestcount() async {
  Map data = {
  "graph_json": {
  "viz": "timeseries",
  "requests": [
  {
  "style": {
  "palette": "dog_classic",
  "type": "solid",
  "width": "normal"
  },
  "type": "bars",
  "formulas": [
  {
  "formula": "query1"
  }
  ],
  "queries": [
  {
  "name": "query1",
  "data_source": "metrics",
  "query": "sum:apiplatform.request.count{name:dev-vikram-dev-vikram-test-v1}.as_count()"
  }
  ],
  "response_format": "timeseries"
  }
  ]
  },
  "legend": "yes",
  "timeframe": "1_week",
  "size": "small",
  "title": "Request Count : test (v1)"

  };
  var client = http.Client();
  var body = json.encode(data);
  var uri = Uri.parse(
  'https://services.gateway.apiplatform.io/v1/generateDatadogEmbed');
  var response = await client.post(
  uri,body: body, headers: {
  "pkey": " 3fd99a6cdda045e23fb310d0ba17f868",
  "apikey": "6aRV9kJkeD6tiCqtMMINA0ycDOLlSeE5",
    'Content-Type': 'application/json',

  });
  if (response.statusCode == 200) {

  var json = response.body;
  return chartsFromJson(json);
  }
  }
  Future<Charts?> gettotalrequest() async {
    Map data = {
      "graph_json": {
        "viz": "query_value",
        "requests": [
          {
            "response_format": "scalar",
            "queries": [
              {
                "name": "query1",
                "data_source": "metrics",
                "query": "sum:apiplatform.request.count{name:dev-vikram-dev-vikram-test-v1}.as_count()",
                "aggregator": "sum"
              }
            ],
            "conditional_formats": [],
            "formulas": [
              {
                "formula": "query1"
              }
            ]
          }
        ],
        "precision": 2,
        "autoscale": true,
        "timeseries_background": {
          "type": "bars"
        }
      },
      "legend": "yes",
      "timeframe": "1_week",
      "size": "small",
      "title": "Total Request : test (v1)"
    };
    var client = http.Client();
    var body = json.encode(data);
    var uri = Uri.parse(
        'https://services.gateway.apiplatform.io/v1/generateDatadogEmbed');
    var response = await client.post(
        uri,body: body, headers: {
      "pkey": " 3fd99a6cdda045e23fb310d0ba17f868",
      "apikey": "6aRV9kJkeD6tiCqtMMINA0ycDOLlSeE5",
      'Content-Type': 'application/json',

    });
    if (response.statusCode == 200) {

      var json = response.body;
      return chartsFromJson(json);
    }
  }
  }

Future<Fulfillment?> fulfillment() async {
  Map data = {
    "detectIntentResponseId": "fff85077-c609-40a5-b69b-f1c83f912bbc",
    "pageInfo": {
      "currentPage": "projects/aiva-359005/locations/us-central1/agents/2341efc1-df02-4fe7-8230-0fc0ae88a51e/flows/6d4b8786-9953-4bc5-b579-2787ece65ca7/pages/4f1c945f-7485-413d-b45f-0b44967f9d5c",
      "displayName": "Display API Details"
    },
    "sessionInfo": {
      "session": "projects/aiva-359005/locations/us-central1/agents/2341efc1-df02-4fe7-8230-0fc0ae88a51e/sessions/77485430",
      "parameters": {
        "api-category": "test",
        "api-database": "default (mongodb - us-east-1)",
        "api-description": "Skipped",
        "api-displayname": "Skipped",
        "api-gateway": "default (apiplatform.io)",
        "api-methods": [
          "GET",
          "PUT",
          "POST"
        ],
        "api-name": "tester",
        "api-publish": "Public",
        "api-tablename": "Accounts",
        "api-version": "v1",
        "Auth": true,
        "check": null,
        "database-name": "default",
        "database-type": "mongodb",
        "email-id": "jeevaneha777@gmail.com",
        "environment": "dev-jeeva2714",
        "partner-key": "3fde6ff25d215cfe3feafdca79bad17f",
        "publish": "Yes",
        "sample-database": "Submitted Details database : default (mongodb - us-east-1)",
        "schema-exist": "Yes",
        "selected-api": "DataAccess",
        "validate-name": "proceed"
      }
    },
    "fulfillmentInfo": {
      "tag": "displayAPIDetails"
    },
    "payload": {
      "attachments": [],
      "groupId": "77485430",
      "botId": "apva-pbez5",
      "from": "5oFNTEctd7iqdtBuRCDjnYMAlrXnsyCd",
      "applicationId": "2db4d10abbba11449fd576aff1b824ae1",
      "env": "dev-jeeva2714",
      "email": "jeevaneha777@gmail.com",
      "auth": true,
      "pkey": "3fde6ff25d215cfe3feafdca79bad17f",
      "messageSource": "1"
    },
    "text": "Public",
    "languageCode": "en-US"
  };
  var client = http.Client();
  var body = json.encode(data);
  var uri = Uri.parse(
      'https://bccc-2401-4900-4ac7-9ad0-d545-92ec-f329-2cf8.in.ngrok.io/chatbot');
  var response = await client.post(uri);
  if (response.statusCode == 200) {

    var json = response.body;
    return fulfillmentFromJson(json);
  }
}

/* Future<Entity?> getentity(){
    var client = http.Client();
    var uri =
    return


void main()
{
  var a=RemoteService();
  a.getChart();
}*/
