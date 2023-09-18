



import 'package:newspaper_app/models/catagories_news_model.dart';
import 'package:newspaper_app/models/news_channels_headlines_model.dart';
import 'package:newspaper_app/repository/news_repository.dart';

class NewsViewModel {

  final _rep = NewsRepository();

  Future<news_channel_headlines_models> fetchNewsChannelHeadlinesApi(String name) async{
    final response = await _rep.fetchNewsChannelHeadlinesApi(name);
    return response;
  }
  Future<CategoriesNewsModels> fetchCategoriesNewsApi(String category) async{
    final response = await _rep.fetchCategoriesNewsApi(category);
    return response;
  }


}