import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newspaper_app/models/catagories_news_model.dart';
import 'package:newspaper_app/models/news_channels_headlines_model.dart';

class NewsRepository{

  Future<news_channel_headlines_models> fetchNewsChannelHeadlinesApi(String name) async{
    String url = "https://newsapi.org/v2/top-headlines?${name}=us&apiKey=4c1edb81ac174b809fff7f3cdd0fdfa4";
    final response = await http.get(Uri.parse(url));


    if(response.statusCode == 200){
      final body = jsonDecode(response.body);
      return news_channel_headlines_models.fromJson(body);

    }
      throw Exception("Error");
  }


  Future<CategoriesNewsModels> fetchCategoriesNewsApi(String catagory) async{
    String url = "https://newsapi.org/v2/everything?q=${catagory}&apiKey=4c1edb81ac174b809fff7f3cdd0fdfa4";
    final response = await http.get(Uri.parse(url));


    if(response.statusCode == 200){
      final body = jsonDecode(response.body);
      return CategoriesNewsModels.fromJson(body);

    }
    throw Exception("Error");
  }

}