import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:newspaper_app/View/category_screen.dart';
import 'package:newspaper_app/models/catagories_news_model.dart';
import 'package:newspaper_app/models/news_channels_headlines_model.dart';
import 'package:newspaper_app/view_model/news_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum FilterList {
 bbcNews, aryNews, independent, reuters,cnn , alJazeera
}

class _HomeScreenState extends State<HomeScreen> {

  NewsViewModel newsViewModel = NewsViewModel();
  FilterList? selectedMenu ;
  final format = DateFormat("MMM dd, yyyy");

  String name = "bbc-news";

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).height * 1;
    final height = MediaQuery.sizeOf(context).height * 1;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset("images/category_icon.png",
          height: 25,width: 25,),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => CategoriesScreen()));
          },
        ),
        backgroundColor: Colors.white,
        title: Center(child: Text("News", style: GoogleFonts.poppins(fontSize: 24,fontWeight: FontWeight.w700,color: Colors.black),)),
        actions: [
          PopupMenuButton<FilterList>(
              initialValue: selectedMenu,
              icon: Icon(Icons.more_vert, color:  Colors.black,size: 30,),
              onSelected: (FilterList item){
                if(FilterList.bbcNews.name == item.name){
                  name = "bbc-news";
                }
                if(FilterList.aryNews.name == item.name){
                  name = "ary-news";
                }
                if(FilterList.independent.name == item.name){
                  name = "independent";
                }
                if(FilterList.reuters.name == item.name){
                  name = "reuters";
                }
                if(FilterList.cnn.name == item.name){
                  name = "cnn";
                }
                if(FilterList.alJazeera.name == item.name){
                  name = "al-jazeera-english";
                }
                setState(() {
                  selectedMenu = item;
                });
              },
              itemBuilder: (context) => <PopupMenuEntry<FilterList>>[
                PopupMenuItem<FilterList>(
                  value: FilterList.bbcNews,
                  child: Text("BBC News"),
                ),
                PopupMenuItem<FilterList>(
                  value: FilterList.aryNews,
                  child: Text("ary-news"),
                ),
                PopupMenuItem<FilterList>(
                  value: FilterList.independent,
                  child: Text("independent News"),
                ),
                PopupMenuItem<FilterList>(
                  value: FilterList.reuters,
                  child: Text("reuters"),
                ),
                PopupMenuItem<FilterList>(
                  value: FilterList.cnn,
                  child: Text("cnn"),
                ),
                PopupMenuItem<FilterList>(
                  value: FilterList.alJazeera,
                  child: Text("alJazeera"),
                ),
              ]
          )
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: height * .55,
            width: width ,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: FutureBuilder<news_channel_headlines_models>(
                future: newsViewModel.fetchNewsChannelHeadlinesApi(name),
                builder: (BuildContext context, snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(
                      child: SpinKitHourGlass(
                        size: 50,
                        color: Colors.blue,
                      ),
                    );
                  }else{
                    return ListView.builder(
                      itemCount: snapshot.data!.articles!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index){

                        DateTime dateTime = DateTime.parse(snapshot.data!.articles![index].publishedAt.toString());

                          return SizedBox(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: height * .6,
                                  width: width * .44,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: height * .02
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: CachedNetworkImage(
                                      imageUrl: snapshot.data!.articles![index].urlToImage.toString(),
                                      fit: BoxFit.cover,
                                      placeholder: (context,url) => Container(
                                        child: spinkkit2,
                                      ),
                                      errorWidget: (context,url, error) => Icon(Icons.error_outline,color: Colors.red,),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 20,
                                  child: Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      height: height * 0.22,
                                      alignment: Alignment.bottomCenter,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: width * .34,
                                            child: Text(snapshot.data!.articles![index].title.toString(),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Spacer(),
                                          Container(
                                            width: width * .34,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(snapshot.data!.articles![index].source!.name.toString(),
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: GoogleFonts.poppins(fontSize: 13,fontWeight: FontWeight.w600),
                                                ),
                                                Text(format.format(dateTime),
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],

                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        }
                    );
                  }
                },
              ),
            ),
          ),
          FutureBuilder<CategoriesNewsModels>(
            future: newsViewModel.fetchCategoriesNewsApi("General"),
            builder: (BuildContext context, snapshot){
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(
                  child: SpinKitHourGlass(
                    size: 50,
                    color: Colors.blue,
                  ),
                );
              }else{
                return ListView.builder(
                  shrinkWrap: true,
                    itemCount: snapshot.data!.articles!.length,
                    itemBuilder: (context, index){

                      DateTime dateTime = DateTime.parse(snapshot.data!.articles![index].publishedAt.toString());

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: CachedNetworkImage(
                                imageUrl: snapshot.data!.articles![index].urlToImage.toString(),
                                fit: BoxFit.cover,
                                height: height * .18,
                                width: width * .13,
                                placeholder: (context,url) => Container(
                                  child: Center(
                                    child: SpinKitHourGlass(
                                      size: 50,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                                errorWidget: (context,url, error) => Icon(Icons.error_outline,color: Colors.red,),
                              ),
                            ),
                            Expanded(
                                child: Container(
                                  height: height * .18,
                                  padding: EdgeInsets.only(left: 15),
                                  child: Column(
                                    children: [
                                      Text(snapshot.data!.articles![index].title.toString(),
                                        maxLines: 3,
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700
                                        ),
                                      ),
                                      Spacer(),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(snapshot.data!.articles![index].source!.name.toString(),
                                            style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600
                                            ),
                                          ),
                                          Text(format.format(dateTime),
                                            maxLines: 3,
                                            style: GoogleFonts.poppins(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500
                                            ),
                                          ),
                                        ],
                                      )

                                    ],
                                  ),
                                )
                            )
                          ],
                        ),
                      );
                    }
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

const spinkkit2 = SpinKitCircle(
  color: Colors.amber,
  size: 50,
);