



import 'package:newspaper_app/models/news_channels_headlines_model.dart';
import 'package:newspaper_app/repository/news_repository.dart';

class NewsViewModel {

  final _rep = NewsRepository();

  Future<news_channel_headlines_models> fetchNewsChannelHeadlinesApi() async{
    final response = await _rep.fetchNewsChannelHeadlinesApi();
    return response;
  }
}