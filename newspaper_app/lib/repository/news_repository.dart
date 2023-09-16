import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newspaper_app/models/news_channel_headlines_model.dart';

class NewsRepository{

  Future<NewsChannelHeadlinesModel> fetchNewsChannelHeadlinesApi() async{
    String url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=4c1edb81ac174b809fff7f3cdd0fdfa4";
    final response = await http.get(Uri.parse(url));

    if(response.statusCode == 200){
      final body = jsonDecode(response.body);
      return NewsChannelHeadlinesModel.fromJson(body);

    }else{
      throw Exception("Error");
    }
  }
}