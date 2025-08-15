import 'package:http/http.dart';
import 'dart:convert';

void main() {
  requestData();
  requestDataAsync();
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

requestDataAsync() async {
  String url =
      "https://gist.githubusercontent.com/FelipeEsteves007/0d965b6ba04917c3c96c7eafa544233a/raw/e169e7b861d27565dbec0b89ab2649672d1e2261/accounts.json";
  Response response = await get(Uri.parse(url));
  print(json.decode(response.body)[0]);
  print("Ultima");
}
