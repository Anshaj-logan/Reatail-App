import 'package:http/http.dart' as http;

class Api {
  final url = 'http://192.168.19.139:2000';

  authData(data, apiUrl) async {
    var fullUrl = url + apiUrl;
    return await http.post(
      Uri.parse(fullUrl),
      body: data,
    );
  }

  getData(apiUrl) async {
    var fullUrl = url + apiUrl;
    return await http.get(
      Uri.parse(fullUrl),
    );
  }
}
