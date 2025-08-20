import 'package:http/http.dart';
import 'dart:convert';

import 'package:my_app/api_key.dart';

void main() {
  //requestData();
  //requestDataAsync();
  sendDataAsync({
    "id" : "001",
    "name" : "Flutter",
    "lastName": "Dart",
    "balance" : "5000"
  });
}

requestData() {
  String url =
      "https://gist.githubusercontent.com/FelipeEsteves007/0d965b6ba04917c3c96c7eafa544233a/raw/e169e7b861d27565dbec0b89ab2649672d1e2261/accounts.json";
  Future<Response> futureResponse = get(Uri.parse(url));
  print(futureResponse);
  futureResponse.then((Response response) {
    print(response);
    print(response.body);
    List<dynamic> listAccounts = json.decode(response.body);
    Map<String, dynamic> mapCarla = listAccounts.firstWhere(
      (element) => element["name"] == "Carla",
    );
    print(mapCarla["balance"]);
  });
  print("ULTIMA");
}

Future<List<dynamic>> requestDataAsync() async {
  String url =
      "https://gist.githubusercontent.com/FelipeEsteves007/0d965b6ba04917c3c96c7eafa544233a/raw/e169e7b861d27565dbec0b89ab2649672d1e2261/accounts.json";
  Response response = await get(Uri.parse(url));
  return json.decode(response.body);
}

sendDataAsync(Map<String, dynamic> mapAccount) async {
  List<dynamic> listAccounts = await requestDataAsync();
  listAccounts.add(mapAccount);
  String content = json.encode(listAccounts);
  
  String url = 
      "https://api.github.com/gists/0d965b6ba04917c3c96c7eafa544233a";

  Response response = await post(
    Uri.parse(url),
     headers: {
      "Authorization" : "Bearer $githubApiKey"
     },
      body: json.encode({
        "description" : "account.son",
        "public" : true,
        "files": {
          "accounts.son": {
            "content": content,
          }
        }
      }),
    );
  print(response.statusCode);

}