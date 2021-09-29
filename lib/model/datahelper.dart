import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/controller/datacontroller.dart';

class Datahelper {
  Future<PostList> getData() async {
    final url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return PostList.fromJson(data);
    } else {
      throw Exception("Faild To Load Data");
    }
  }
}
