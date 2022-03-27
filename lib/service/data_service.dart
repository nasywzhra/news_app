import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapp/model/articeles.dart';

String apiKey = 'a482e1831c69451784a303321eca2196';
String baseUrl = 'https://newsapi.org/v2/top-headlines';

// https://newsapi.org/v2/top-headlines?country=us&apiKey=f342cff3d5de4e6abc0604909f533bf4

class News {
  Future<List<Article>?> getNews() async {
    List<Article>? list ;
    String url = '$baseUrl?country=id&apiKey=$apiKey' ;
    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var result = data['articles'] as List ;
      list = result.map<Article>((json) => Article.fromJson(json)).toList();
      print(response.body);
      return list;
    } else {
      throw Exception("Error can't acces this web");
    }
  }

  Future<List<Article>?> getNewsByCategory(String category) async {
    List<Article>? list ;
    String url = '$baseUrl?country=id&apiKey=$apiKey&category=$category' ;
    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var result = data['articles'] as List ;
      list = result.map<Article>((json) => Article.fromJson(json)).toList();
      print(response.body);
      return list;
    } else {
      throw Exception("Error can't acces this web");
    }
  }

}